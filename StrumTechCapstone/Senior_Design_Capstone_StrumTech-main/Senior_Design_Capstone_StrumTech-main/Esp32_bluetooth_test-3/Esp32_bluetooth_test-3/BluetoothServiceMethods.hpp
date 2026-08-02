#ifndef GUITAR_BLE_SERVICE_METHODS
#define GUITAR_BLE_SERVICE_METHODS
//Prototypes 
#include "WString.h"
#include "ControlData.hpp"
#include  <Arduino.h>
#include "BluetoothServiceData.hpp"
#include <ArduinoBLE.h>

bool ISCONNECTED = false;
bool ISADVERTISING = false;
bool ISCONTROLSIGNALFLAGREAD = false;


// handlers
void blePeripheralConnectHandler(BLEDevice central);
void blePeripheralDisconnectHandler(BLEDevice central);
void controlSignalCharReadHandler(BLEDevice central, BLECharacteristic characteristic);


// received
String BluetoothRecievedChordData();
int BluetoothRecievedModeData(int currentMode);
bool BluetoothRecievedDigiEffectData(char input[], int size);

// send
void BluetoothSendTunerDataJSONCString(char output[]);
void BluetoothSendControlData(int mode);

// setup
void SetupBluetoothService();
void AdvertiseDevice();
void InitializeGuitarService();
void InitializeModesService();

// maintainace
bool HandleBluetoothConnnection();

void DetectSignalStrength();
void reset();
#endif // GUITAR_BLE_SERVICE_METHODS