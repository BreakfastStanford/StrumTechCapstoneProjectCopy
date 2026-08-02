//
//  BLEDelagateObject .swift
//  GuitarApp
//
//  Created by Gerald Stanford on 12/26/23.
//
/*
 Handles the setup of the corebluetooth library functions
 Gets data ready for the central manager and the peripheral code
 */


import Foundation
import CoreBluetooth

class BlEDelageteObject: NSObject
{
    
    static let singleInstance = BlEDelageteObject()
    
    var delegate: BleConnectionProtocol? = nil
    
    let NUMBER_OF_SERVICES: Int = 2
    var SERVICES_FOUND: Int = 0
    
    
    // initialization variables
    // set once conditions are met, unset on disconnect
    var CONNECTED_TO_PERI : Bool = false
    var IS_READY_FOR_MODE_ASSIGNMENT: Bool = false
    var IS_READY_TO_SCAN: Bool = false
    var IS_SETUP_COMPLETE: Bool = false
    var FAIL_CONNECTION: Bool = false // used to end async method
    
    
    
    var GUITAR_MODE_WRITTEN_SUCCESFULLY : Bool = false
    var CURRENT_GUITAR_MODE: GuitarModeEnum? = nil
    var PENDING_GUITAR_MODE: GuitarModeEnum? = nil
    var CONTROL_RECIEVED: Bool = false
    
    var chordModeValue: UInt32 = 2
    var tunerModeValue: UInt32 = 1
    var freeModeValue: UInt32 = 3
    
    var guitarPeripheralName: String? = nil
    var errorMan: ErrorManager = ErrorManager(BlueToothErrorEnum: BlueToothError.peripheralDiscoveryError)
    
    
    var uuids: cbuuidStruct = cbuuidStruct()
    
    // central and peripheral control objects
    let centralManager: CBCentralManager = CBCentralManager()
    var guitarPeripheral: CBPeripheral? = nil
    
    // scanning uuids
    // the service thats being scanned for may not be the only service available on the device
    // so may need to scan for main service and then discover other services once connected
    var ScanForTheseServices: [CBUUID] = []  // holds the service uuids needed to find them on the peripheral
    var ScanForTheseCharacteristicsGuitarService: [CBUUID] = []
    var ScanForTheseCharacteristicsModeService: [CBUUID] = []
    
    //wrapper arrays
    var servicesClassWrapperArray: [BLEService] = [] // holds the service classes that will called on to perform tasks
    var characteristicsClassWrapperArray : [bbb] = [] // holds the chracteristic classes
    
    // establish services
   
    var mainGuitarService: BLEService? = nil
    var modeSelectionService: BLEService? = nil
    
    
    /***************************establish characteristics ************************/
 
    
    //guitarservice charcateristics
   // var tunerNumberCharacteristic: BLECharacteristic<Float>? = nil
    var chordCharacteristic: BLECharacteristic<String>? = nil
    var controlSignalCharacteristic: BLECharacteristic<String>? = nil
    var effectsCharacteristic: BLECharacteristic<String>? = nil
  //  var tunerNoteCharacteristic: BLECharacteristic<String>? = nil
    var tunerJsonCharacteristic: BLECharacteristic<String>? = nil
    
    // modeservice charcateristics
    var modeSwitchCharacteristic: BLECharacteristic<Int>? = nil
    var freeModeCharacterisitic:BLECharacteristic<Int>? = nil
    var tunerModeCharacterisitic:BLECharacteristic<Int>? = nil
    var chordModeCharacterisitic:BLECharacteristic<Int>? = nil

    
    override private init()
    {
        super.init()
       // setUpServices()
       // setUpCharacteristics()
        centralManager.delegate = self
        setUpServices()
        setUpCharacteristics()
        print("BLEdelegate initialized")
        print("CBcenman \(centralManager)")
    }
    
    
    func delegateError(_ error: Error?) -> Bool
    {
   
        if(error != nil)
        {
            print("Delegate Error Entered: \(String(describing: error?.localizedDescription))")
            print("Error debug \(error.debugDescription)")
            print("Error publisher: \(error.publisher)")
           // errorMan.BlueToothErrorEnum = BlueToothError.peripheralDiscoveryError
           // errorMan.errorMessage = error?.localizedDescription
           // errorMan.error = true
         //   print("Delegate Error Entered: \(String(describing: errorMan.errorMessage))")
          //  print("Delegate Error Entered: \(String(describing: errorMan))")
            return true
        }
        
        return false
    }
    
    func scanForPeripherals()
    {
      //  setUpServices()
       // setUpCharacteristics()
        centralManager.scanForPeripherals(withServices: ScanForTheseServices)
        print("Scanning for periperhals")
    }
    
    
    
    
    
    private func setUpServices()
       {
           //Establish service
           // add it to the list/array of services to look out for
           //
          // centralManager.delegate = self
           mainGuitarService = BLEService(uuids.guitarService_UUID)
           modeSelectionService = BLEService(uuids.modeService_UUID)
           
           servicesClassWrapperArray.append(mainGuitarService!)
           servicesClassWrapperArray.append(modeSelectionService!)
           
           ScanForTheseServices.append(mainGuitarService!.uuid)
           ScanForTheseServices.append(modeSelectionService!.uuid)
           
           
       }
       
    
       private func setUpCharacteristics()
       {
           setUpGuitarCharacterisitics()
           setUpModeCharacterisitcs()
        
       }
        
        
  private func setUpGuitarCharacterisitics()
    {
        //guitar services
       // tunerNumberCharacteristic = BLECharacteristic(uuids.guitartuner_number_Char_UUID)
        chordCharacteristic = BLECharacteristic(uuids.guitarchord_Char_UUID)
        controlSignalCharacteristic = BLECharacteristic(uuids.guitarControlSignal_Char_UUID)
        effectsCharacteristic = BLECharacteristic(uuids.guitarEffect_Char_UUID)
      //  tunerNoteCharacteristic = BLECharacteristic(uuids.guitartuner_note_Char_UUID)
        tunerJsonCharacteristic = BLECharacteristic(uuids.guitartuner_json_Char_UUID)
    
        ScanForTheseCharacteristicsGuitarService.append(uuids.guitarchord_Char_UUID)
        //ScanForTheseCharacteristicsGuitarService.append(uuids.guitartuner_number_Char_UUID)
        ScanForTheseCharacteristicsGuitarService.append(uuids.guitarControlSignal_Char_UUID)
        ScanForTheseCharacteristicsGuitarService.append(uuids.guitarEffect_Char_UUID)
       // ScanForTheseCharacteristicsGuitarService.append(uuids.guitartuner_note_Char_UUID)
        ScanForTheseCharacteristicsGuitarService.append(uuids.guitartuner_json_Char_UUID)
        
       // characteristicsClassWrapperArray.append(tunerNumberCharacteristic!)
        characteristicsClassWrapperArray.append(chordCharacteristic!)
        characteristicsClassWrapperArray.append(effectsCharacteristic!)
        characteristicsClassWrapperArray.append(controlSignalCharacteristic!)
       // characteristicsClassWrapperArray.append(tunerNoteCharacteristic!)
        characteristicsClassWrapperArray.append(tunerJsonCharacteristic!)
        
        
    }
    
     
   private func setUpModeCharacterisitcs()
    {
        //mode service
        modeSwitchCharacteristic = BLECharacteristic(uuids.modeService_ModeSwitch_Char_UUID)
        freeModeCharacterisitic = BLECharacteristic(uuids.modeService_free_Char_UUID)
        tunerModeCharacterisitic = BLECharacteristic(uuids.modeService_tuner_Char_UUID)
        chordModeCharacterisitic = BLECharacteristic(uuids.modeService_chord_Char_UUID)
        
        ScanForTheseCharacteristicsModeService.append(uuids.modeService_ModeSwitch_Char_UUID)
        ScanForTheseCharacteristicsModeService.append(uuids.modeService_chord_Char_UUID)
        ScanForTheseCharacteristicsModeService.append(uuids.modeService_free_Char_UUID)
        ScanForTheseCharacteristicsModeService.append(uuids.modeService_tuner_Char_UUID)
        
        characteristicsClassWrapperArray.append(modeSwitchCharacteristic!)
        characteristicsClassWrapperArray.append(freeModeCharacterisitic!)
        characteristicsClassWrapperArray.append(tunerModeCharacterisitic!)
        characteristicsClassWrapperArray.append(chordModeCharacterisitic!)
        
    }
    
    private func returnServices() -> Array<BLEService>
     { 
         return servicesClassWrapperArray
     }
    
}


protocol BleConnectionProtocol
{
    func OnDisconnect() -> ()
    func OnReadValueUpdated() -> ()
    func OnAfterReconnect() -> ()
    var bleObject: BlEDelageteObject? { get set }
}

