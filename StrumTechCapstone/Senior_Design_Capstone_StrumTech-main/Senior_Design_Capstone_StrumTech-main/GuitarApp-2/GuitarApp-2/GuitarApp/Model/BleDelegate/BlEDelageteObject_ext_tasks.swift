//
//  BlEDelageteObject_ext_tasks.swift
//  GuitarApp
//
//  Created by Gerald Stanford on 2/25/24.
//

import Foundation
import CoreBluetooth

extension BlEDelageteObject
{
    
    
    /**SENDING DATA CODE **/
    
    func sendStringDataOverBluetooth(_ value: String, _ characteristic: BLECharacteristic<String>, _ withResponse: Bool)
    {
        if(characteristic.characteristic != nil)
        {
            let data: Data = value.data(using: .utf8) ?? Data()
            print("about to send : \(value)")
            
            if(!withResponse)
            {
                guitarPeripheral?.writeValue(data, for: (characteristic.characteristic)!, type: CBCharacteristicWriteType.withoutResponse)
            }
            else
            {
                guitarPeripheral?.writeValue(data, for: (characteristic.characteristic)!, type: CBCharacteristicWriteType.withResponse)
            }
        }
        
    }
    
    func sendModeSendOverBluetooth(_ value: GuitarModeEnum)
    {
        PENDING_GUITAR_MODE = value
        var mode: UInt32 = 0
        if(value == .chord)
        {
            mode = chordModeValue
        }
        else if (value == .free)
        {
            mode = freeModeValue
        }
        else if (value == .tuner)
        {
            mode = tunerModeValue
        }
        else
        {
            mode = freeModeValue
            print("Guitar mode chosen incorrectly in {sendModeDataOverBluetooth} ")
        }
        
        
        if(modeSwitchCharacteristic?.characteristic != nil)
        {
            print("DetermineModeSendOverBluetooth mode to send: \(mode)")
            let modeToSend = Data(bytes: &mode, count: 1)
            guitarPeripheral?.writeValue(modeToSend, for: (modeSwitchCharacteristic?.characteristic)!, type: CBCharacteristicWriteType.withResponse)
            
            // assuming it returned true
            if(value == .chord)
            {
                CURRENT_GUITAR_MODE = .chord;
            }
            else if (value == .free)
            {
                CURRENT_GUITAR_MODE = .free;
            }
            else if (value == .tuner)
            {
                CURRENT_GUITAR_MODE = .tuner;
            }
           
        }
        else
        {
            print("WriteModeSendOverBluetooth method: mode switch characteristic is nil")
        }
    }
 
    
    /**RETRIEVING DATA CODE **/

    
    /*Initialization code**/
    
    
    
    func RetrieveValueFromCharacteristicArray(_ characteristic: CBCharacteristic)
    {
        for ch in characteristicsClassWrapperArray
        {

            if(ch.uuid == characteristic.uuid)
            {
                print("uuids match")
                if(ch is BLECharacteristic<Int>)
                {
                    let chBle = ch as! BLECharacteristic<Int>
                    retrieveIntFromDataObject(chBle, characteristic.value ?? Data())
                }
                else if (ch is BLECharacteristic<String>)
                {
                    let chBle = ch as! BLECharacteristic<String>
                    print("String pick Characteristic value: \(String(describing: characteristic.value))")
                    retrieveStringFromDataObject(chBle, characteristic.value ?? Data())
                    
                }
                else
                {
                    print("Can't retrieve from this data type")
                }
            }
        }
    }
    
    
    func retrieveStringFromDataObject(_ characteristic: BLECharacteristic<String> ,_ data: Data)
    {
        print("Retrieveing string data")
        let defaultData : String = ""
        // set data object
        characteristic.value = data
        
        if(data.isEmpty)
        {
            characteristic.valueConverted = defaultData
            print("data empty, error {retrieveFloatDataBluetooth}")
            return;
        }
        
        if let str = String(data: data, encoding: .utf8) {
            print("String:", str) // Output: Hello, world!
            characteristic.valueConverted = str
            characteristic.setUpdatedTrue()
        } else {
            print("Failed to convert data to string {retrieveStringFromDataObject} ")
            characteristic.valueConverted = ""
        }
        
        
    }
 
    func retrieveIntFromDataObject(_ characteristic: BLECharacteristic<Int> ,_ data: Data)
    {
        
        print("retrieve int called")
        let defaultData : Int = 0
        // set data object
        characteristic.value = data
        
        if(data.isEmpty)
        {
            characteristic.valueConverted = defaultData
            print("data empty, error {retrieveFloatDataBluetooth}")
            return;
        }
        // do I have to handle this memory?
        let buffer  = UnsafeMutableBufferPointer<Int>.allocate(capacity: 1)
      
        var byteNumber = characteristic.value?.copyBytes(to: buffer)
        if(byteNumber != MemoryLayout<Int>.size)
        {
            //idk
            print("Didn't read mode charcateristic value {retrieveFloatDataBluetooth}")
            return;
        }
        
        characteristic.valueConverted = buffer[0]
        buffer.deallocate()
    }

    // called on init
    func setModeValuesFromCharacteristic()
    {
        // do I have to handle this memory
        let buffer  = UnsafeMutableBufferPointer<UInt32>.allocate(capacity: 1)
      
        var byteNumber = chordModeCharacterisitic!.value?.copyBytes(to: buffer)
        if(byteNumber != 4)
        {
            //idk
            print("Didn't read mode charcateristic value")
            return;
        }
        
       // number = buffer.first!
        chordModeValue = buffer[0]
        byteNumber = 0;
        
        byteNumber = tunerModeCharacterisitic!.value?.copyBytes(to: buffer)
        if(byteNumber != 4)
        {
            //idk
            print("Didn't read mode charcateristic value")
            return;
        }
        
        tunerModeValue = buffer[0]
        byteNumber = 0;
        
        byteNumber = freeModeCharacterisitic!.value?.copyBytes(to: buffer)
        if(byteNumber != 4)
        {
            //idk
            print("Didn't read mode charcateristic value")
            return;
        }
        
        freeModeValue = buffer[0]
    }
    
    
}












//charcater
//int
//float
/*
func retrieveSimpledataFromDataObject<T>(_ characteristic: BLECharacteristic<T> ,_ data: Data)
{
    let defaultData : T = "0" as! T
    // set data object
    characteristic.value = data
    
    if(data.isEmpty)
    {
        characteristic.valueConverted = defaultData
        print("data empty, error {retrieveFloatDataBluetooth}")
        return;
    }
    // do I have to handle this memory?
    var buffer : UnsafeMutableBufferPointer<T>
  
    var byteNumber = characteristic.value?.copyBytes(to: buffer)
    if(byteNumber != MemoryLayout<T>.size)
    {
        //idk
        print("Didn't read mode charcateristic value {retrieveFloatDataBluetooth}")
        return;
    }
    
    characteristic.valueConverted = buffer[0]
}

*/
//chord data is sent ~
//mode switch data is sent ~
// effect data is sent ~
// free mode sent~
// tuner mode sent ~
//chord mode sent~



//tuner data is recieved
//control data is recieved...some sort of confirmation... all though i think characteristics have that capability



/*
func retrieveFloatFromDataObject(_ characteristic: BLECharacteristic<Float> ,_ data: Data)
{
    let defaultData : Float = 0
    // set data object
    characteristic.value = data
    
    if(data.isEmpty)
    {
        characteristic.valueConverted = defaultData
        print("data empty, error {retrieveFloatDataBluetooth}")
        return;
    }
    // do I have to handle this memory?
    let buffer  = UnsafeMutableBufferPointer<Float>.allocate(capacity: 1)
  
    var byteNumber = characteristic.value?.copyBytes(to: buffer)
    if(byteNumber != MemoryLayout<Float>.size)
    {
        //idk
        print("Didn't read mode charcateristic value {retrieveFloatDataBluetooth}")
        return;
    }
    
    characteristic.valueConverted = buffer[0]
    buffer.deallocate()
}


func retrieveIntFromDataObject(_ characteristic: BLECharacteristic<Int> ,_ data: Data)
{
    
    print("retrieve int called")
    let defaultData : Int = 0
    // set data object
    characteristic.value = data
    
    if(data.isEmpty)
    {
        characteristic.valueConverted = defaultData
        print("data empty, error {retrieveFloatDataBluetooth}")
        return;
    }
    // do I have to handle this memory?
    let buffer  = UnsafeMutableBufferPointer<Int>.allocate(capacity: 1)
  
    var byteNumber = characteristic.value?.copyBytes(to: buffer)
    if(byteNumber != MemoryLayout<Int>.size)
    {
        //idk
        print("Didn't read mode charcateristic value {retrieveFloatDataBluetooth}")
        return;
    }
    
    characteristic.valueConverted = buffer[0]
    buffer.deallocate()
}

func retrieveCharacterFromDataObject(_ characteristic: BLECharacteristic<Character> ,_ data: Data)
{
    let defaultData : Character = "0"
    // set data object
    characteristic.value = data
    
    if(data.isEmpty)
    {
        characteristic.valueConverted = defaultData
        print("data empty, error {retrieveFloatDataBluetooth}")
        return;
    }
    // do I have to handle this memory?
    let buffer  = UnsafeMutableBufferPointer<Character>.allocate(capacity: 1)
  
    var byteNumber = characteristic.value?.copyBytes(to: buffer)
    if(byteNumber != MemoryLayout<Character>.size)
    {
        //idk
        print("Didn't read mode charcateristic value {retrieveFloatDataBluetooth}")
        return;
    }
    
    characteristic.valueConverted = buffer[0]
    buffer.deallocate()
}
*/


/*
func sendChordDataOverBluetooth(_ value: String)
{
    if(chordCharacteristic?.characteristic != nil)
    {
        
        let chord: Data = value.data(using: .utf8) ?? Data()
        print("about to send chord: \(value)")
        guitarPeripheral?.writeValue(chord, for: (chordCharacteristic?.characteristic)!, type: CBCharacteristicWriteType.withoutResponse)
    }
}

func sendEffectsDataOverBluetooth(_ value: String)
{
    if(effectsCharacteristic?.characteristic != nil)
    {
        let effectData: Data = value.data(using: .utf8) ?? Data()
        print("about to send chord: \(value)")
        guitarPeripheral?.writeValue(effectData, for: (effectsCharacteristic?.characteristic)!, type: CBCharacteristicWriteType.withoutResponse)
    }

}
*/



/*
func RetrieveValueFromCharacteristicArray(_ characteristic: CBCharacteristic)
{
    for ch in characteristicsClassWrapperArray
    {

        if(ch.uuid == characteristic.uuid)
        {
            print("uuids match")
            if(ch is BLECharacteristic<Int>)
            {
                let chBle = ch as! BLECharacteristic<Int>
                retrieveIntFromDataObject(chBle, characteristic.value ?? Data())
            }
            else if(ch is BLECharacteristic<Float>)
            {
                let chBle = ch as! BLECharacteristic<Float>
                retrieveFloatFromDataObject(chBle, characteristic.value ?? Data())
            }
            else if (ch is BLECharacteristic<Character>)
            {
                let chBle = ch as! BLECharacteristic<Character>
                retrieveCharacterFromDataObject(chBle, characteristic.value ?? Data())
            }
            else if (ch is BLECharacteristic<String>)
            {
                let chBle = ch as! BLECharacteristic<String>
                print("String pick Characteristic value: \(String(describing: characteristic.value))")
                retrieveStringFromDataObject(chBle, characteristic.value ?? Data())
                
            }
            else
            {
                print("Can't retrieve from this data type")
            }
        }
    }
}
*/
