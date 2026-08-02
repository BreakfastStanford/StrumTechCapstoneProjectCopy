//
//  SetUpController.swift
//  GuitarApp
//
//  Created by Gerald Stanford on 3/24/24.
//

import UIKit

class SetUpController: BaseConnectionControllers
{
    
    @IBOutlet weak var ConnectStatusInfo: UILabel!
    
    @IBOutlet weak var ConnectionProgressWheel: UIActivityIndicatorView!
    
    @IBOutlet weak var WelcomeLabel: UILabel!
    
    let tabBarId: String = "TabBarControl"
    let segueId: String = "PostSetupSegue"
    
    // Connection Text
    var defaultStatusText: String = "Setting up Connection. . ."
    var scanningStatusText: String = "Scanning for Strum Tech Guitar. . ."
    var initStatusText: String = "Initialization. . ."
    var finishedStatusText: String = "Connection Complete"
    var unableStatusText: String = "Unable to connect"
    
    var ConnectionFailedFlag: Bool = false
    var AlertVisibleFlag: Bool = false
    
    var alertTimer: Timer? = nil
    
   
/*
    var assignDelegate: (UIViewController) -> Void =
    {
        control in
        if(control is UINavigationController)
        {
            var cnav = control as! UINavigationController
            
            cnav.delegate = GuitarUINavigationDelegate.singleInstance
        }
    }
   */


    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        var tab = segue.destination
        if(segue.identifier == segueId && tab is UITabBarController)
        {
            
            let tabTab = tab as! UITabBarController
           // tab.children.forEach(assignDelegate)
           // tabTab.delegate = GuitarUITabBarDelegate.singleInstance
            //bleObject?.CURRENT_GUITAR_MODE = .free
          //  bleObject?.sendModeSendOverBluetooth(.free)
            
        }
    }
    */

    
    // this method basically needs to reset all the condition values 
    // and disconnect from the peripheral if already connected
    override func CleanUpOnFailure()
    {
        super.CleanUpOnFailure()
        ConnectStatusInfo.text = unableStatusText
        ConnectionProgressWheel.stopAnimating()
    }
    
    
    
    override func UpdateViewOnPreScanning()
    {
        WelcomeLabel.isHidden = true
        ConnectStatusInfo.isHidden = false
        ConnectionProgressWheel.isHidden = false
        ConnectionProgressWheel.startAnimating()
    }
    
    override func UpdateViewOnScanning()
    {
        ConnectStatusInfo.text = scanningStatusText
    }
    
    override func UpdateViewOnInit()
    {
        ConnectStatusInfo.text = initStatusText
    }
    
    override func UpdateViewOnFinished()
    {
        ConnectStatusInfo.text = finishedStatusText
        ConnectionProgressWheel.stopAnimating()
    }
    
    
    func CreateAlert()
    {
        let controller = self
        let alert = UIAlertController(title: "Unable to Connect To StrumTech Guitar", message: "Try Again?", preferredStyle: .alert)
        
        
        let connectButton = UIAlertAction(title: "Connect" , style: .default)
        {
            _ in
            
            Task
              {
                 
                  var result: Bool = false
                  do
                  {
                      result =  try await controller.SetUpBleObject()
                  }
                  catch
                  {
                      controller.ActionOnError()
                  }
                  
                  result ? controller.ActionOnSuccess() : controller.ActionOnFailure()
              }
        }
      //  let dismissButton = UIAlertAction(title: "Dismiss" , style: .cancel)
        
        alert.addAction(connectButton)
       // alert.addAction(dismissButton)
        
        alert.preferredAction = connectButton
        
        self.present(alert, animated: true)
        controller.stopTimers()
    }
    
    
    
    func startTimers()
    {
        startAlertTimer()
    }
    
    
    func stopTimers()
    {
        if(alertTimer != nil)
        {
            alertTimer?.invalidate()
            alertTimer = nil
        }
    }
    
    
    func startAlertTimer() {
          // Invalidate the timer if it's already running to avoid duplicates
          alertTimer?.invalidate()

          // Schedule a timer to call the `timerAction` method every second
          alertTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(alertTimerAction), userInfo: nil, repeats: true)
      }
    

      @objc func alertTimerAction() {
          // Perform any action you want to repeat here
          if(ConnectionFailedFlag && !AlertVisibleFlag)
          {
              CreateAlert()
              AlertVisibleFlag = true
          }
      }
    
    override func ActionOnError() 
    {
        // i dont even know what this throws
         super.ActionOnError()
         ConnectionFailedFlag = true
         startTimers()
    }
    
    override func ActionOnSuccess() 
    {
        super.ActionOnSuccess()
        stopTimers()
        // start segue
        //bleObject!.CONTROL_RECIEVED = true  // needed for inititial starting of app
        print("action on success called")
        performSegue(withIdentifier: segueId, sender: nil)
    }
    
    override func ActionOnFailure() 
    {
        super.ActionOnFailure()
        ConnectionFailedFlag = true
        startTimers()
    }
    
}



