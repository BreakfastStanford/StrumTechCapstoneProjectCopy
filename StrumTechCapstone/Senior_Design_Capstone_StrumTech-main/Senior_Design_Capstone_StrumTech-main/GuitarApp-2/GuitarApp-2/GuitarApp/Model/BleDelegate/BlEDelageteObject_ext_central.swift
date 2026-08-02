//
//  BlEDelageteObject_ext_central.swift
//  GuitarApp
//
//  Created by Gerald Stanford on 2/22/24.
//used to design the central bluetooth components

import Foundation
import CoreBluetooth


/* delegates called from the managers*/
extension BlEDelageteObject : CBCentralManagerDelegate
{
    
    // I'm guessing this is called everytime the centralmanager updates its state
    func centralManagerDidUpdateState(_ central: CBCentralManager)
    {
        if(central.state == CBManagerState.poweredOn)
        {
            print("in powereed on state")
            // only state to issue commands in
            
            //scanForPeripherals()
            SetReadyToScanForPeri(true)
        }
        else if(central.state == CBManagerState.unsupported)
        {
            SetReadyToScanForPeri(false)
            print("Not in powereed on state")
        }
        else if(central.state == CBManagerState.poweredOff)
        {
            SetReadyToScanForPeri(false)
            print("Not in powereed on state")
        }
        else if(central.state == CBManagerState.resetting)
        {
            SetReadyToScanForPeri(false)
            print("Not in powereed on state")
        }
        else if(central.state == CBManagerState.unauthorized)
        {
            SetReadyToScanForPeri(false)
            print("Not in powereed on state")
        }
        else if(central.state == CBManagerState.unknown)
        {
            SetReadyToScanForPeri(false)
            print("Not in powereed on state")
        }
        
        
    }
    
    
    // Called everytime the central manager discovers a peripheral
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
 
        print("Peripheral discovered")
        // assigns the found peripheral to the property
        var localName: String
       
        // assign values and assign defualts just in case
        let isConnectable: NSNumber = advertisementData[CBAdvertisementDataIsConnectable] as? NSNumber ?? -111
        let l: NSString = advertisementData[CBAdvertisementDataLocalNameKey] as? NSString ?? "NoName"
        
        localName = l as String
        print("Is connectable value \(isConnectable)")
        
        // check if connectable and if proper name
        if(isConnectable as! Bool && localName == uuids.guitarAppLocalName)
        {
            guitarPeripheral = peripheral
            central.connect(guitarPeripheral!)
            
            // stop scanning, save power
            central.stopScan()
            print("Scanning stopped");
        }
        
    
    }
    
    
    
    // called when initially connecting to the peripheral
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral)
    {
        print("connected to peripheral")
        guitarPeripheral?.delegate = self
        guitarPeripheral?.discoverServices(ScanForTheseServices)
        
    }
    
  
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) 
    {
        
        delegateError(error)
        DisconnectFromPeri()
    
        delegate!.OnDisconnect()
        
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        delegateError(error)
        SetFailCOnnection(true)
    }
    
    func centralManager(_ central: CBCentralManager, willRestoreState dict: [String : Any]) {
        
    }
    
}
