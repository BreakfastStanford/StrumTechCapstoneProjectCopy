
//
//  BLEViewControllerBase.swift
//  GuitarApp
//
//  Created by Gerald Stanford on 12/28/23.
//

import UIKit

protocol BLEViewControllerBaseAbstract
{
    func SetDefaultGuitarMode() -> GuitarModeEnum
}


// handles stroing of the bleobject as well as the perform method
// that is needed to passs the ble object to the other viewcontrollers
class BLEViewControllerBase: UIViewController, BLEViewControllerBaseAbstract, UINavigationControllerDelegate, BleConnectionProtocol
{
    
    func AfterModeSwitchReturn()
    {
        print("after mode switch called")
        bleObject?.delegate = self
        CheckConnection()
    }
    
    func OnAfterReconnect() 
    {
        CheckConnection()
        CheckMode()
    }
    
    var bleObject: BlEDelageteObject? = nil
    
    func OnReadValueUpdated() 
    {
        
    }
    
   // var modeChecked: Bool = false
    
   // var navigation: UINavigationController?
   // var navDelegate: GuitarUINavigationDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        bleObject = BlEDelageteObject.singleInstance // currently a singleton instance
    }
    
    //timers stopped on seque
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        print("There wasa a segue")
        transitionCleanup()
    }
    
   
    // return a specific mode
    func SetDefaultGuitarMode() -> GuitarModeEnum {
        fatalError("Subclasses must override calculateArea method")
    }
    
    
    func transitionCleanup()
    {
        //stopTimers()
        bleObject!.CURRENT_GUITAR_MODE = nil
    }
    
    // maybe viewill appear would be better
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        print("view did appear")
        bleObject?.delegate = self
        CheckConnection()
        CheckMode()
      
        
    }
  
    func CheckConnection()
    {
        if(bleObject!.CONNECTED_TO_PERI)
        {
            return
        }
        
        OnDisconnect()
    }
    
    func CheckMode()
    {
        if(bleObject!.IsModeWritten(SetDefaultGuitarMode()) == false)
        {
            OpenModeSwitchChecker()
        }
    }
    
    func OpenModeSwitchChecker()
    {
        bleObject?.sendModeSendOverBluetooth(SetDefaultGuitarMode())
        let controllerString = "ModeController"
        let modalController = storyboard?.instantiateViewController(identifier: controllerString)
        
        if(modalController is ModeSwitchController)
        {
            let modeControl = modalController as! ModeSwitchController
            modeControl.Initialize(bleObject ?? BlEDelageteObject.singleInstance, SetDefaultGuitarMode(), self)
            self.present(modalController!, animated: true)
            
        }
        
    }
    
    func OnDisconnect() {
    
            let controllerString = "ReconnectionView"
            let modalController = storyboard?.instantiateViewController(identifier: controllerString)
        
            //show(modalController!, sender: self)
            present(modalController!, animated: true)
            //showDetailViewController(modalController!, sender: self)
    }
}

/**
 
 https://developer.apple.com/documentation/uikit/view_controllers/displaying_and_managing_views_with_a_view_controller
 
 
 */
