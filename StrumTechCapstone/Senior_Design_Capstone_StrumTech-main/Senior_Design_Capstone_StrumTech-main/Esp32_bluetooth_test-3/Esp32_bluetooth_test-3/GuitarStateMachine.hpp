#ifndef GUITAR_STATE_MACHINE
#define GUITAR_STATE_MACHINE
#include "ControlData.hpp"
#include "BluetoothServiceMethods.hpp"
#include "Tuner.hpp"
#include "PixelLibrary.hpp"
#include "DigitalEffects.hpp"
#include <Arduino.h>

enum StateProgress{GUITAR_STATE_NEW, GUITAR_STATE_CONT, GUITAR_STATE_EXIT};
enum StateProgress GUITAR_STATE_PROGRESS = GUITAR_STATE_NEW;

void ExecuteCurrentMode();
void SwitchToMode(int mode);
void FreeModeState();
void TunerModeState();
void ChordModeState();

void ModeChangedSignal();
void GuitarSetup();

// new mode setup
void NewModeInit(int mode);
void IndicateChordModeWithLights(int mode);
void TurnOffLightIndication();

bool APP_STARTING = true;

#endif // GUITAR_STATE_MACHINE