#include <Arduino.h>
#include "BluetoothServiceMethods.hpp"
#include "ControlData.hpp"
#include "Arduino.h"
#include "GuitarStateMachine.hpp"

/****** setup *********/

void setup()
{
  GuitarSetup();
  Serial.begin(9600);
  while(!Serial);
  SetupBluetoothService();  
  Serial.print("Print something");
 
}
 

void loop()
{
  if (!HandleBluetoothConnnection()) 
  {
    return;
  }

  ExecuteCurrentMode();
  SetModeData();
  delay(100);
}






