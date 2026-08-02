//
//  ModeSwitchController.swift
//  GuitarApp
//
//  Created by Gerald Stanford on 3/31/24.
//

import UIKit

class ModeSwitchController : UIViewController, BleConnectionProtocol
{
    func OnAfterReconnect() {
        print("After reconnect")
        WaitForModeCompletion()
    }
    
    func OnDisconnect() 
    {
        print("Disconnected")
        connectionFailureDuringModeswitch = true
    }
    
    func OnReadValueUpdated() {
        
    }
    
    var bleObject: BlEDelageteObject? = nil
    var MODE : GuitarModeEnum? = nil
    var connectionFailureDuringModeswitch : Bool = false
    var caller: BLEViewControllerBase? = nil
    
    
    // how many times is this called in a presented view
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if(MODE == nil)
        {
          print("Guitar Mode Not properly set")
          fatalError("Must set mode prior to opening mode switch")
            
        }
        bleObject?.delegate = self
        if(bleObject!.IsModeWritten(MODE!) == false)
        {
            print("Entered mode switch")
            WaitForModeCompletion()
        }
        else
        {
            print("Mode not false, mode is mode \(String(describing: bleObject?.CURRENT_GUITAR_MODE))")
            print("Mode not false, mode is control \(String(describing: bleObject?.CONTROL_RECIEVED))")
            dismiss(animated: true)
        }
        
        
    }
    
    // called from the iniializer to set up the class for execution
    func Initialize(_ ble: BlEDelageteObject, _ mode : GuitarModeEnum, _ caller: BLEViewControllerBase)
    {
        bleObject = ble
        MODE = mode
        self.caller = caller
       
    }
    
    // 3 tasks:
    // return to previous controller on mode set (good)
    // return on disconnect (good)
    // try again on write error
    // do i need to cancel this task?
    func WaitForModeCompletion()
    {
        print("Entered wait for completion")

        Task
        {
            print("Entered task")
            while(bleObject!.IsModeWritten(MODE!) == false && !connectionFailureDuringModeswitch)
            {
                
                print("modal waiting in loop")
                print(bleObject?.controlSignalCharacteristic! as Any)
                try? await Task.sleep(nanoseconds: 20000000)
                
            }
            
            
            
            if(!connectionFailureDuringModeswitch && bleObject!.IsModeWritten(MODE!) == true)
            {
                bleObject!.ResetControl()
                print("leaving mode switch")
                
                OnDismiss(false)
            
            }
            else if (connectionFailureDuringModeswitch)
            {
                
                print("leaving mode switch")
                OnDismiss(true)
            }
            
        }
      
    }
    
    func CheckConnection()-> Bool
    {
        if(bleObject!.CONNECTED_TO_PERI)
        {
            return true
        }
        
        return false
    }
    
    private func OnDismiss(_ disconnected: Bool)
    {
        let parent = self.presentingViewController
        
        dismiss(animated: true)
        {
            [self] in
            print("Dismiss called from mode switch")
            if (caller != nil && !disconnected)
            {
                print("Dismiss called from mode switch - mode switch complete")
                caller?.AfterModeSwitchReturn()
            }
            
            if (caller != nil && disconnected)
            {
                print("Dismiss called from mode switch - disconnection occured")
                caller?.OnDisconnect()
            }
        }
    }
}
