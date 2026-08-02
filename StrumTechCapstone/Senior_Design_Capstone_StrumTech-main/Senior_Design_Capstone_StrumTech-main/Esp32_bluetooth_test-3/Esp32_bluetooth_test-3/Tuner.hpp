/*
#include "WString.h"
#include <sys/_intsup.h>

#ifndef GUITAR_TUNER
#define GUITAR_TUNER
#include "arduinoFFT.h"
#include "Arduino.h"
//#include <TimerOne.h> // maybe delete
//#include <SoftwareSerial.h> // maybe delete

arduinoFFT FFT = arduinoFFT();
unsigned int samplingPeriod;
const int interruptPin = 13;
float TUNER_NUMBER;
String TUNER_NOTE; // need to watch out for strings
void Tuner();
void timerSetup();

#define SAMPLES 128
#define SAMPLING_FREQUENCY 2048
#define TUNER_PIN 0

#endif // GUITAR_TUNER

*/


#ifndef GUITAR_TUNER
#define GUITAR_TUNER
#include "Arduino.h"
#include "arduinoFFT.h"

#define SAMPLES 128
#define SAMPLING_FREQUENCY 2048

//Defines the boundaries of the applicable octaves of notes
#define OCT2Begin 63.5
#define OCT3Begin 127.135
#define OCT4Begin 254.285
#define OCT5Begin 508.565
#define OCT6Begin 1017.13

//#define TUNER_PIN 5
#define TUNER_PIN 4
// was 4
float TUNER_NUMBER = 100;
String TUNER_NOTE = ""; // need to watch out for strings
String TUNER_COLOR= "";
float octaveScale;
//Used for determining the note an4d closeness to proper pitch
float upperBound;
float lowerBound;
float lowRedStartBound;
float lowRedBound;
float lowYellowBound;
float greenBound;
float highYellowBound;
float highRedBound;
float lowRedStartScale = .973;
float lowRedScale = .9815;
float lowYellowScale = .99;
float greenScale = 1.01;
float highYellowScale = 1.0185;
float highRedScale = 1.037;
float freqArray[12] = {32.7, 34.65, 36.71, 38.89, 41.2, 43.65, 46.25, 49, 51.91, 55, 58.27, 61.74};
String noteArray[12] = {"C", "C#/Db", "D", "D#/Eb", "E", "F", "F#/Gb", "G", "G#/Ab", "A", "A#/Bb", "B"};


arduinoFFT FFT = arduinoFFT();

unsigned int samplingPeriod;
boolean debug = true; //Whether or not to print responses from the ESP in the serial monitor


void Tuner();
void timerSetup();


const int interruptPin = 13;


#endif // GUITAR_TUNER