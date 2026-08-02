#ifndef GUITAR_CONTROL_DATA
#define GUITAR_CONTROL_DATA
#include  <Arduino.h>
#include "WString.h"
#include "BluetoothServiceData.hpp"

enum ControlModes{TUNER_MODE_SETTING = 1 , CHORDS_MODE_SETTING = 2, FREE_MODE_SETTIING = 3 , NO_MODE};
enum ControlModes CURRENT_MODE_SETTINGS = NO_MODE;
enum ControlModes NEXT_MODE_SETTINGS = FREE_MODE_SETTIING;

String Characteristic_chord;
float Characteristic_tuner;
int Characteristic_effect;
enum ControlModes currentMode;
enum ControlModes nextMode;

void SetModeData();
enum ControlModes MapToMode(int mode);
#endif // GUITAR_CONTROL_DATA