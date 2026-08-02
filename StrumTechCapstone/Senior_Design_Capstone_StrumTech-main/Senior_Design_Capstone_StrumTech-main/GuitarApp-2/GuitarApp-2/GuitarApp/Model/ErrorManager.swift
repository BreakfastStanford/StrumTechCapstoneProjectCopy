//
//  ErrorManager.swift
//  GuitarApp
//
//  Created by Gerald Stanford on 12/22/23.
//

import Foundation


struct ErrorManager
{

    var BlueToothErrorEnum: BlueToothError
    var errorMessage: String?
    var error: Bool = false
    
}

enum BlueToothError: Error
{
    case peripheralDiscoveryError
}
