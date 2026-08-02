//
//  ModalController.swift
//  GuitarApp
//
//  Created by Gerald Stanford on 3/31/24.
//

import UIKit

class ModalController: UIViewController
{
    
    @IBOutlet weak var informLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var contentView: UIView!
    override func   viewDidLoad() {
        super.viewDidLoad()
        configView()
        
    }
    
    
    
    func configView()
    {
        self.view.backgroundColor = .clear
        self.backView.backgroundColor = .black.withAlphaComponent(0.6)
        self.backView.alpha = 0
        //self.contentView.alpha = 0
        self.contentView.layer.cornerRadius = 10
    }
    
    
}
