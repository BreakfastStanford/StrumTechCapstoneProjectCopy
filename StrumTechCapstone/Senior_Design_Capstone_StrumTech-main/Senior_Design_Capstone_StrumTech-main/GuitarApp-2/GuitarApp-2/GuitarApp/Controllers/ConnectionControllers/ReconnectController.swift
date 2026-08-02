//
//  ReconnectController.swift
//  GuitarApp
//
//  Created by Gerald Stanford on 3/31/24.
//

import UIKit

class ReconnectController : BaseConnectionControllers
{
    @IBOutlet weak var informLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var connectButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func UpdateViewOnPreScanning() {
        super.UpdateViewOnPreScanning()
        configView()
    }
    
    func configView()
    {
        self.view.backgroundColor = .clear
        //self.contentView.alpha = 0
        self.contentView.layer.cornerRadius = 10
        self.connectButton.isHidden = true
    }
        
        
    override func ActionOnSuccess() 
    {
        super.ActionOnSuccess()
        print("successfull reconnect")
        print(self.presentingViewController?.children)
        let parent = self.presentingViewController
        dismiss(animated: true)
        {
            print("Dismiss entered")
            print(self)
            print(self.presentingViewController)
            if (parent?.children[0] is BleConnectionProtocol)
            {
                print("Dismiss entered bleprot")
                let controller = parent?.children[0] as! BleConnectionProtocol
                controller.OnAfterReconnect()
            }
        }
    }
    
    override func ActionOnFailure() 
    {
        super.ActionOnFailure()
        informLabel.text = "Could Not reconnect to Guitar...is it on?"
        self.connectButton.isHidden = true
        self.connectButton.setTitle("REconnect", for: .normal)
    }
    override func ActionOnError() 
    {
        super.ActionOnError()
    }
    
  
    @IBAction func Reconnect(_ sender: Any)
    {
        Connect()
    }
    
}
