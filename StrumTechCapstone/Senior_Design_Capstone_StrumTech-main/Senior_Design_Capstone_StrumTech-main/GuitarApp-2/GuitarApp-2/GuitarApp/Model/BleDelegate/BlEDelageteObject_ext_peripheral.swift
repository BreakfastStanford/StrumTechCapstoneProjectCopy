//
//  BlEDelageteObject_ext_peripheral.swift
//  GuitarApp
//
//  Created by Gerald Stanford on 2/22/24.
// used to design the peripheral bluetooth components

import Foundation
import CoreBluetooth



extension BlEDelageteObject: CBPeripheralDelegate
{
    
 
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?)
    {
        
        SetConnectionStatus(true)
        print("Connnected to peripheral and discovering services")
       // var NumberOfServices: Int = 0
        
        if(delegateError(error))
        {
            print("diddiscoverservices error: ")
            print(error)
            return
        }
     
        // https://stackoverflow.com/questions/64404208/for-in-loop-requires-uservehicles-to-conform-to-sequence-did-you-mean-to
        // check every service inper
        for service in peripheral.services ?? []
        {
            
            if(mainGuitarService!.uuid == service.uuid)
            {
                // assign to the proper service variable
                mainGuitarService!.service = service
                print("Discovered Guitar Service \(service)")
                peripheral.discoverCharacteristics(ScanForTheseCharacteristicsGuitarService, for: service)
            }
            else if (modeSelectionService!.uuid == service.uuid)
            {
                modeSelectionService!.service = service
                print("Discovered Mode service \(service)")
                peripheral.discoverCharacteristics(ScanForTheseCharacteristicsModeService, for: service)
                
            }
        }
            
        
        
        
    }
    
    
    // called when the specified characteristics of a service are discovered
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?)
    {
        var charIndex = 0;
        if(delegateError(error)){ return }
        print("List of Characteristics discovered For this Service: \(service)")
        
        // should have a value
        for characteristic in service.characteristics ?? []
        {
            
            for (index, value) in characteristicsClassWrapperArray.enumerated() 
            {
               
                if(value.uuid == characteristic.uuid)
                {
                    print("Index:", index, "Value:", value)
                    // retrieve index
                    charIndex = index
                   
                    if (characteristic.properties.contains(CBCharacteristicProperties.notify))
                    {
                       peripheral.setNotifyValue(true, for: characteristic)
                    }
                    break
                }
            }
                
            // assign to the proper service variable
            characteristicsClassWrapperArray[charIndex].characteristic = characteristic
            print("This characteristic was discovered: \(characteristic.uuid)")
        }
        
        // can move this later to the main setup controller 
        // used to set the free mode/chord mode...etc when the characteristics are first discovered
        if(service.uuid == uuids.modeService_UUID)
        {
            setModeValuesFromCharacteristic()
            SetConnectionStatus(true)
            SetReadyForModeAssingments(true)
        }
        
        SERVICES_FOUND += 1
        
        // initialization is complete
        if(SERVICES_FOUND == NUMBER_OF_SERVICES)
        {
            SetSetupIsComplete(true)
        }
        
    }
    
    // reading characterisc values
    // handles manual as well as subscriptions
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?)
    {

        if(delegateError(error)){ return }
        print("A characteristic was updated: \(characteristic)")
        
        // find the right characteristic and store the value
       RetrieveValueFromCharacteristicArray(characteristic)
       delegate?.OnReadValueUpdated()
        
        if (characteristic.uuid == controlSignalCharacteristic?.uuid)
        {
            print("update value: control received")
            CONTROL_RECIEVED = true
        }
        
    }
    
    
    
    
    
    // subcribing to a charateristic value
    // mostly called once on subcription
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?)
    {
        if(delegateError(error)){ return }
        print("subscribed to characteristic\(characteristic.uuid)")
        // this is being called slightly after initialization
        // not too important now
        
    }
    
    
    
    // response to writing to a characteristic
    // could be used to check if a send is not working
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?)
    {
        if(delegateError(error))
        {
            if (characteristic.uuid == modeSwitchCharacteristic?.uuid)
            {
               //??
            }
            return
            
        }
        print("response to writing to characteristic\(characteristic.uuid)")
        if (characteristic.uuid == modeSwitchCharacteristic?.uuid)
        {
            CURRENT_GUITAR_MODE = PENDING_GUITAR_MODE
            GUITAR_MODE_WRITTEN_SUCCESFULLY = true
        }
        // i think a variable should be set here to allow action
        // or to tell the next view that the switch was positive
    }
    
    
    
}





















/*
func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?)
{
   // var NumberOfServices: Int = 0
    
    if(delegateError(error)){ return }
 
    // https://stackoverflow.com/questions/64404208/for-in-loop-requires-uservehicles-to-conform-to-sequence-did-you-mean-to
    // check every service inper
    for service in peripheral.services ?? []
    {
        // dynamically assign to the right service variable
        for bleservice in servicesClassWrapperArray
        {
            if(bleservice.uuid == service.uuid)
            {
                // assign to the proper service variable
                bleservice.service = service
                
                peripheral.discoverCharacteristics([uuids.guitarchord_Char_UUID, uuids.guitartuner_Char_UUID], for: service)
              //  NumberOfServices += 1
                break
            }
        }
        
    }
    
    
}
*/
