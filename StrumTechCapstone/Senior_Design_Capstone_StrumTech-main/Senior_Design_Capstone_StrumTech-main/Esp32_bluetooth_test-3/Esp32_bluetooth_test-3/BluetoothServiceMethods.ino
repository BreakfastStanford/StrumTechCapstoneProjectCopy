#include "BluetoothServiceMethods.hpp"

// handlers

void blePeripheralConnectHandler(BLEDevice central)
{
    Serial.println("Bluetooth connected");
    ISCONNECTED = true;
}


void blePeripheralDisconnectHandler(BLEDevice central)
{

  Serial.println("Bluetooth disconnected");
  ISCONNECTED = false;
  
}


void controlSignalCharReadHandler(BLEDevice central, BLECharacteristic characteristic)
{
  ISCONTROLSIGNALFLAGREAD = true;
}

//////////// SEND


void BluetoothSendTunerDataJSON(String output)
{
  if(tuner_json_char.writeValue(output) == 1)
  {
    //Sucess
    Serial.println("Data Sent: tuner note");
  }
  else
  {
    Serial.println("Issue Sending data: tuner note");
  }
}

void BluetoothSendTunerDataJSONCString(char output[])
{
  if(tuner_json_char.writeValue(output) == 1)
  {
    //Sucess
    Serial.println("Data Sent: tuner note");
  }
  else
  {
    Serial.println("Issue Sending data: tuner note");
  }
}


// used for synchronization
void BluetoothSendControlData(int mode)
{
  if(control_char.writeValue("Y") == 1)
  {
    //Sucess
    Serial.println("Data Sent: conrol data");
  }
  else
  {
    Serial.println("Issue Sending data: control data");
  }
}


///////////// RECIEVE


// gets received data and assigns it to any variables for later use in the loop 
String BluetoothRecievedChordData()
{
  Serial.println("BluetoothRecievedChordData is called");
  if(chord_char.written())
  {
    Serial.println("Chord data recieved: " + chord_char.value());
   return chord_char.value();
  }
  return "";
}


enum ControlModes CheckifBluetoothRecievedModeData(enum ControlModes currentMode)
{
  Serial.println("CheckifBluetoothRecievedModeData entered");
  if (mode_switch_char.written())
  {
    Serial.println("New mode recieved: " + MapToMode(mode_switch_char.value()));
    return MapToMode(mode_switch_char.value());
  }

 // Serial.println("Old mode maintained " + currentMode);
  return currentMode;
}


bool BluetoothRecievedDigiEffectData(char input[], int size)
{
  if(effect_char.written() && effect_char.valueLength() <= size)
  {
    Serial.print(effect_char.value());
    effect_char.value().toCharArray(input, size);
    return true;

  }

  return false;
}


// perform actions based on the signal strength 
void DetectSignalStrength()
{


}


// 
// returns whether or not the device is currently advertising
// assign to variable for later use
void AdvertiseDevice()
{
  // needs to advertise
  if(!BLE.connected() && !ISADVERTISING)
  {
    Serial.println("Bluetooth Not Connected and not advertising");
    ISCONNECTED = false;
    if (BLE.advertise())
    {
      ISADVERTISING = true;
    }
    else 
    {
      ISADVERTISING = false;
    }
    return;
  }

  // need to connect
  else if(!BLE.connected() && ISADVERTISING) 
  {
    ISCONNECTED = false;
    return ;
  }

  // ready to use
  else if(BLE.connected())
  {
    ISADVERTISING = true;
    BLE.stopAdvertise();
    ISADVERTISING = false;
    return;
  }
}




void SetupBluetoothService()
{
  // begin initialization
  if (!BLE.begin()) {
    Serial.println("starting Bluetooth® Low Energy module failed!");
    while (1);
  }

  BLE.setLocalName(peripheralLocalName);
  BLE.setAdvertisedService( guitarService );
  BLE.setEventHandler(BLEConnected, blePeripheralConnectHandler);
  BLE.setEventHandler(BLEDisconnected, blePeripheralDisconnectHandler);

  InitializeGuitarService();
  InitializeModesService();

  BLE.advertise();
  Serial.println("Bluetooth® device active, waiting for connections...");
}

void InitializeGuitarService()
{
  guitarService.addCharacteristic(chord_char);
  //guitarService.addCharacteristic(tuner_number_char);
  guitarService.addCharacteristic(control_char);
  guitarService.addCharacteristic(effect_char);
  guitarService.addCharacteristic(tuner_json_char);
  chord_char.setValue("");
  //tuner_number_char.setValue(0.0);
  mode_switch_char.setValue(0);
  control_char.setValue("");
  effect_char.setValue("");
  tuner_json_char.setValue("");

  control_char.setEventHandler(BLERead, controlSignalCharReadHandler);
  BLE.addService(guitarService);
}

void InitializeModesService()
{

  modeService.addCharacteristic(mode_switch_char);
  modeService.addCharacteristic(free_mode_char);
  modeService.addCharacteristic(tuner_mode_char);
  modeService.addCharacteristic(chord_mode_char);
  free_mode_char.setValue(FREE_MODE_SETTIING);
  tuner_mode_char.setValue(TUNER_MODE_SETTING);
  chord_mode_char.setValue(CHORDS_MODE_SETTING);
  BLE.addService(modeService);
}


// ensures that the bluetooth connection is up and running on every loop
bool HandleBluetoothConnnection()
{

  BLE.poll(100);
  AdvertiseDevice();
  if (!ISADVERTISING && ISCONNECTED)
  {
    return true;
  }
  
  reset();
  // either still advertising and or not connected
  return false;
}


void reset()
{
    CURRENT_MODE_SETTINGS = NO_MODE;
   NEXT_MODE_SETTINGS = FREE_MODE_SETTIING;

}