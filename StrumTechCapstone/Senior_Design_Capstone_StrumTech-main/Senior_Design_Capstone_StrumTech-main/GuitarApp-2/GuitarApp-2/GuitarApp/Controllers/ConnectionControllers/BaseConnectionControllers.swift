//
//  BaseConnectionControllers.swift
//  GuitarApp
//
//  Created by Gerald Stanford on 3/31/24.
//

import UIKit


class BaseConnectionControllers: UIViewController, BleConnectionProtocol
{
    func OnAfterReconnect() 
    {
        
    }
    
    func OnReadValueUpdated() {
    
    }
    
   
    
    func OnDisconnect() {
       // fix later
    }
    
    var bleObject: BlEDelageteObject? = nil
    var connectionTask : Task<(), Never>? = nil
    override func viewDidLoad()
    {
        super.viewDidLoad()
      
        Connect()
    }
    
    
    func Connect()
    {
        // piece of asynch code
        print("Starting Connection")
        Task
        {
            var result: Bool = false
            do
            {
                result =  try await SetUpBleObject()
            }
            catch
            {
                ActionOnError()
            }
            
            result ? ActionOnSuccess() : ActionOnFailure()
        }
        
    }
    
    
    func SetUpBleObject() async throws -> Bool
    {
        var connected : Bool = false
        var scanning : Bool = false
        var readyToUse: Bool = false
        
        
        bleObject = BlEDelageteObject.singleInstance
        if(bleObject != nil)
        {
            print("prescanning")
            UpdateViewOnPreScanning()
            scanning = await bleObject!.ReadyToScanAsync()
            
            if (scanning)
            {
                print("scanning")
                UpdateViewOnScanning()
                bleObject!.scanForPeripherals()
                connected = await bleObject!.IsConnectedToPeriAsync()
                
            }
    
            if(connected)
            {
                print("init")
                UpdateViewOnInit()
                readyToUse = await bleObject!.IsFullyConnectedToPeriAsync()
            }
    
            
            if(readyToUse)
            {
                print("done")
                UpdateViewOnFinished()
                return true
               
            }
           
            return false
           
        }
        return false
    }
    
    
    // this method basically needs to reset all the condition values
    // and disconnect from the peripheral if already connected
    func CleanUpOnFailure()
    {
        if(bleObject != nil)
        {
            bleObject!.DisconnectFromPeri()
        }
    }
    

    func UpdateViewOnPreScanning()
    {
        
    }
    
    func UpdateViewOnScanning()
    {
        
    }
    
    func UpdateViewOnInit()
    {
        
    }
    
    func UpdateViewOnFinished()
    {
        
    }
    
 
    
    func ActionOnFailure()
    {
        CleanUpOnFailure()
    }
    
    func ActionOnSuccess()
    {
        /*
        if(bleObject != nil)
        {
            bleObject?.ResetConnectionFlags()
        }
         */
    }
    
    func ActionOnError()
    {
        CleanUpOnFailure()
    }
    
   
}
