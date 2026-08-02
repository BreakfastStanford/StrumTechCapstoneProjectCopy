//
//  CBUUIDs.swift
//  GuitarApp
//
//  Created by Gerald Stanford on 11/29/23.
//

import CoreBluetooth

struct cbuuidStruct{
    
    // app name id
    let guitarAppLocalName: String = "GuitarApp_StrumTech"
    
    let guitarService_UUID: CBUUID
    let modeService_UUID: CBUUID
    
    // guitar service characteristics uuids

    //let guitartuner_number_Char_UUID: CBUUID
    let guitarchord_Char_UUID: CBUUID
    let guitarControlSignal_Char_UUID: CBUUID
    let guitarEffect_Char_UUID: CBUUID
    //let guitartuner_note_Char_UUID: CBUUID
    let guitartuner_json_Char_UUID: CBUUID
    
    // mode service characteristics uuids

    let modeService_ModeSwitch_Char_UUID: CBUUID
    let modeService_free_Char_UUID: CBUUID
    let modeService_tuner_Char_UUID: CBUUID
    let modeService_chord_Char_UUID: CBUUID
    
    
    init()
    {
        let guitarService_UUID_l = "D619F8C0-A596-4E27-8DFF-62825C1E4839"
        let guitartuner_number_Char_UUID_l = "D619F8C1-A596-4E27-8DFF-62825C1E4839"
        let guitar_chord_data_UUID_l = "D619F8C2-A596-4E27-8DFF-62825C1E4839"
        let guitarControlSignal_Char_UUID_l = "D619F8C4-A596-4E27-8DFF-62825C1E4839"
        let guitarEffect_Char_UUID_l = "D619F8C5-A596-4E27-8DFF-62825C1E4839"
        let guitartuner_note_Char_UUID_l = "D619F8C6-A596-4E27-8DFF-62825C1E4839"
        let guitartuner_json_Char_UUID_l = "D619F8C7-A596-4E27-8DFF-62825C1E4839"
        
        let modeService_UUID_l = "F619F8C0-A596-4E27-8DFF-62825C1E4839"
        let modeService_ModeSwitch_Char_UUID_l = "D619F8C3-A596-4E27-8DFF-62825C1E4839"
        let modeService_free_Char_UUID_l = "F619F8C1-A596-4E27-8DFF-62825C1E4839"
        let modeService_tuner_Char_UUID_l = "F619F8C2-A596-4E27-8DFF-62825C1E4839"
        let modeService_chord_Char_UUID_l = "F619F8C3-A596-4E27-8DFF-62825C1E4839"
        
        self.guitarService_UUID = CBUUID(string: guitarService_UUID_l)
        self.modeService_UUID = CBUUID(string: modeService_UUID_l)
        
        //self.guitartuner_number_Char_UUID = CBUUID(string: guitartuner_number_Char_UUID_l)
        self.guitarchord_Char_UUID = CBUUID(string: guitar_chord_data_UUID_l)
        self.guitarControlSignal_Char_UUID = CBUUID(string: guitarControlSignal_Char_UUID_l)
        self.guitarEffect_Char_UUID = CBUUID(string: guitarEffect_Char_UUID_l)
       // self.guitartuner_note_Char_UUID = CBUUID(string: guitartuner_note_Char_UUID_l)
        self.guitartuner_json_Char_UUID = CBUUID(string: guitartuner_json_Char_UUID_l)
        
        
        self.modeService_ModeSwitch_Char_UUID = CBUUID(string: modeService_ModeSwitch_Char_UUID_l)
        self.modeService_free_Char_UUID = CBUUID(string: modeService_free_Char_UUID_l)
        self.modeService_chord_Char_UUID = CBUUID(string: modeService_chord_Char_UUID_l)
        self.modeService_tuner_Char_UUID = CBUUID(string: modeService_tuner_Char_UUID_l)
    }
}

