#include "BLETypedCharacteristics.h"
#include "BLEProperty.h"
#ifndef GUITAR_BLE_SERVICE_DATA
#define GUITAR_BLE_SERVICE_DATA
#include <ArduinoBLE.h>

const int chord_char_length = 50;
const int json_length = 180;
char peripheralLocalName[] = "GuitarApp_StrumTech";

// Default Service
char* ble_uuid = "D619F8C0-A596-4E27-8DFF-62825C1E4839";
//char* tuner_numerical_value_uuid = "D619F8C1-A596-4E27-8DFF-62825C1E4839";
char* chord_data_uuid = "D619F8C2-A596-4E27-8DFF-62825C1E4839";
char* control_signal_uuid = "D619F8C4-A596-4E27-8DFF-62825C1E4839"; // maybe delete - this could be used for sync though
char* digital_effect_uuid = "D619F8C5-A596-4E27-8DFF-62825C1E4839";
//char* tuner_note_value_uuid = "D619F8C6-A596-4E27-8DFF-62825C1E4839";
char* tuner_json_uuid = "D619F8C7-A596-4E27-8DFF-62825C1E4839";

BLEService guitarService(ble_uuid);
BLEStringCharacteristic chord_char(chord_data_uuid, BLERead|BLEWrite|BLEWriteWithoutResponse, chord_char_length);
////BLEFloatCharacteristic tuner_number_char(tuner_numerical_value_uuid, BLERead|BLENotify);
//BLEIntCharacteristic control_char(control_signal_uuid, BLERead|BLEWrite|BLENotify);
BLEStringCharacteristic control_char(control_signal_uuid, BLERead|BLEWrite| BLENotify, chord_char_length);
BLEStringCharacteristic effect_char(digital_effect_uuid, BLERead|BLEWrite|BLEWriteWithoutResponse, json_length);
//BLEStringCharacteristic tuner_note_char( tuner_note_value_uuid, BLERead| BLENotify, chord_char_length);
BLEStringCharacteristic tuner_json_char(tuner_json_uuid, BLERead| BLENotify, json_length);

 
// Mode Service, used to get data on the vaious modes
char* modes_uuid = "F619F8C0-A596-4E27-8DFF-62825C1E4839";
char* mode_switch_uuid = "D619F8C3-A596-4E27-8DFF-62825C1E4839";
char* free_mode_uuid = "F619F8C1-A596-4E27-8DFF-62825C1E4839";
char* tuner_mode_uuid = "F619F8C2-A596-4E27-8DFF-62825C1E4839";
char* chord_mode_uuid = "F619F8C3-A596-4E27-8DFF-62825C1E4839";


BLEService modeService(modes_uuid);
BLEIntCharacteristic mode_switch_char(mode_switch_uuid, BLERead|BLEWrite);

// these values are read only and are used by the app to determine which value to set
// the mode_char to
BLEIntCharacteristic free_mode_char(free_mode_uuid, BLERead);
BLEIntCharacteristic tuner_mode_char(tuner_mode_uuid, BLERead);
BLEIntCharacteristic chord_mode_char(chord_mode_uuid, BLERead);


#endif // GUITAR_BLE_SERVICE_DATA