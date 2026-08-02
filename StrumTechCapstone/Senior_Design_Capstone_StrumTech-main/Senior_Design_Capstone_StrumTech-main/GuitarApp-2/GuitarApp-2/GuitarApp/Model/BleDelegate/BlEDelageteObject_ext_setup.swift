//
//  BlEDelageteObject_ext_setup.swift
//  GuitarApp
//
//  Created by Gerald Stanford on 3/24/24.
//

import Foundation
import CoreBluetooth

extension BlEDelageteObject
{
    
    func ReadyToScanAsync() async -> Bool
    {
       
        while !IS_READY_TO_SCAN
        {
            print("ReadyToScanAsync about to yield")
            await Task.yield()
          
            if(FAIL_CONNECTION)
            {
                break
            }
        }
        
        if(IS_READY_TO_SCAN)
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func IsConnectedToPeriAsync() async -> Bool
    {
       
        while !CONNECTED_TO_PERI
        {
            await Task.yield()
          
            if(FAIL_CONNECTION )
            {
                break
            }
        }
        
        if(CONNECTED_TO_PERI)
        {
            return true
        }
        else
        {
            return false
        }
        
    }
    
    
    func IsFullyConnectedToPeriAsync() async -> Bool
    {
      
        while !IS_SETUP_COMPLETE
        {
            await Task.yield()
            if(FAIL_CONNECTION )
            {
                break
            }
        }
        
        if(IS_SETUP_COMPLETE)
        {
            return true
        }
        else
        {
            return false
        }
    }
    
}
