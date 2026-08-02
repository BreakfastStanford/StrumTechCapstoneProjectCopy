#include "esp32-hal-gpio.h"
#ifndef DIGITAL_EFFECTS
#define DIGITAL_EFFECTS

#define digitalpin1 2 //38
#define digitalpin2 3 //39
//#define analogpin1 0  //36
//#define analogpin2 1 //37
//#define digitalpin1 38
//#define digitalpin2 39
//#define analogpin1 36
//#define analogpin2 37

#include "ControlData.hpp"
#include "BluetoothServiceMethods.hpp"
#include "Tuner.hpp"
#include "PixelLibrary.hpp"

void SendEffect(int pickEffect, int analog1, int analog2);
//int CURRENT_EFFECT= 0;

void DigitalEffectsSetup();


#endif //DIGITAL_EFFECTS
