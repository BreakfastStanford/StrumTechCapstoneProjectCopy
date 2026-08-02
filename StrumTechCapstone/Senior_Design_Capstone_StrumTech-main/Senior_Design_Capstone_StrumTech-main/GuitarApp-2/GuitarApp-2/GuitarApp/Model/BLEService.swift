//
//  BLEService.swift
//  GuitarApp
//
//  Created by Gerald Stanford on 12/23/23.
//

import Foundation
import CoreBluetooth

protocol Bleuuid
{
    var uuid : CBUUID { get set }
}


class BLEService: Bleuuid
{
    var uuid: CBUUID
    var service: CBService?

    init(_ uuid: CBUUID)
    {
        self.uuid = uuid
        service = nil
    }
    
    // make a reference to associated chracteristics here
    
}

protocol bbb: Bleuuid
{
    var characteristic : CBCharacteristic? {get set}
    
}

class BLECharacteristic<T>: bbb
{
    var characteristic: CBCharacteristic?
    
    // do i need the callbacks??
    var uuid: CBUUID
    var value : Data?
    var valueConverted : T?
    private var updated: Bool
    
    
    var callBack : (()->())?
    
    init(_ uuid: CBUUID)
    {
        self.uuid = uuid
        characteristic = nil
        value = nil
        valueConverted = nil
        updated = false
    }
    
    
    init(_ uuid: CBUUID,_ cb: @escaping () -> ())
    {
        self.uuid = uuid
        characteristic = nil
        value = nil
        callBack = cb
        valueConverted = nil
        updated = false
    }

    // this is a race condition
    func isUpdated() -> Bool
    {
        if(updated)
        {
            updated = false
            return true
        }
        
        return false
    }
    
    func setUpdatedTrue()
    {
        updated = true
    }
}
