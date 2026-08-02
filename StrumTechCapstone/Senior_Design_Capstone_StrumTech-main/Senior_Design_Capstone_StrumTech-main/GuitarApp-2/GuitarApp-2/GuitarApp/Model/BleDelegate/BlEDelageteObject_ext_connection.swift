//
//  BlEDelageteObject_ext_connection.swift
//  GuitarApp
//
//  Created by Gerald Stanford on 3/2/24.
//

import Foundation
import CoreBluetooth

extension BlEDelageteObject
{
    
    func SetConnectionStatus(_ isConnnected: Bool)
    {
        CONNECTED_TO_PERI = isConnnected
    }
    
    func SetReadyForModeAssingments(_ canAssignMode: Bool )
    {
        IS_READY_FOR_MODE_ASSIGNMENT = canAssignMode
    }
    
    
    func SetReadyToScanForPeri(_ canScan: Bool)
    {
        IS_READY_TO_SCAN = canScan
    }
    
    func SetSetupIsComplete(_ setupDone: Bool)
    {
        IS_SETUP_COMPLETE = setupDone
    }
    
    func SetFailCOnnection(_ fail: Bool)
    {
        FAIL_CONNECTION = fail
    }
    
    func DisconnectFromPeri()
    {
        ResetConnectionFlags()
        UnsubscribeToNotifications()
        if(guitarPeripheral != nil)
        {
            //and any CBPeripheral class commands that are still pending to the peripheral you’re trying to disconnect may or may not finish executing...hmmm
            centralManager.cancelPeripheralConnection(guitarPeripheral!)
        }
        
    }
    
    func ResetConnectionFlags()
    {
        
        CONNECTED_TO_PERI = false
        IS_READY_FOR_MODE_ASSIGNMENT = false
        IS_SETUP_COMPLETE = false
        FAIL_CONNECTION = false
        SERVICES_FOUND = 0
    }
    
    private func UnsubscribeToNotifications()
    {
        // do I need to check to make sure the array is not empty???
        // array made on init now so shouldn't be a problem
        for ch in characteristicsClassWrapperArray
        {
            if(guitarPeripheral != nil)
            {
                if (ch.characteristic != nil && ch.characteristic!.properties.contains(CBCharacteristicProperties.notify))
                {
                    guitarPeripheral!.setNotifyValue(false, for: ch.characteristic!)
                }
            }
        }
    
    }
    
    public func IsModeWritten(_ mode: GuitarModeEnum) -> Bool
    {
        if(mode == CURRENT_GUITAR_MODE && CONTROL_RECIEVED)
        {
            return true
        }
        
        return false
    }
    
    public func ResetControl()
    {
        CONTROL_RECIEVED = false
    }
    
    /*
    // returns true if connection is good
    func TestConnection() -> Bool
    {
        return true
    }
    */
    
}
