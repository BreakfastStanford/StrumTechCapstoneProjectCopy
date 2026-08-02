
#include "Tuner.hpp"
/*
/* tuner code 
void Tuner(){
  double vReal[SAMPLES];
  double vImag[SAMPLES];
  int half_steps_from_A1;
  unsigned long microSeconds;
  for(int i=0; i<SAMPLES; i++){
    microSeconds = micros();

    vReal[i]=analogRead(TUNER_PIN);
    vImag[i]=0;

   while(micros() < (microSeconds + samplingPeriod)){
      
    }
    
  }
  FFT.Windowing(vReal,SAMPLES, FFT_WIN_TYP_HAMMING, FFT_FORWARD);
  FFT.Compute(vReal, vImag, SAMPLES, FFT_FORWARD);
  FFT.ComplexToMagnitude(vReal, vImag, SAMPLES);
  
  double outputFrequency = FFT.MajorPeak(vReal, SAMPLES, SAMPLING_FREQUENCY);
  Serial.println(outputFrequency);

  //Frequency to Note Name conversion
  half_steps_from_A1 = (log(outputFrequency/55)/log(1.05946));
  TUNER_NUMBER = half_steps_from_A1;

  if ((half_steps_from_A1 % 12) == 0){
    TUNER_NOTE = "A";
    Serial.println(TUNER_NOTE);
  }
  if ((half_steps_from_A1 % 12) == 1){
    TUNER_NOTE = "A# / Bb";
    Serial.println(TUNER_NOTE);
  }
  if ((half_steps_from_A1 % 12) == 2){
    TUNER_NOTE = "B";
    Serial.println(TUNER_NOTE);
  }
  if ((half_steps_from_A1 % 12) == 3){
    TUNER_NOTE = "C";
   Serial.println(TUNER_NOTE);
  }
  if ((half_steps_from_A1 % 12) == 4){
    TUNER_NOTE = "C# / Db";
    Serial.println(TUNER_NOTE);
  }
  if ((half_steps_from_A1 % 12) == 5){
    TUNER_NOTE = "D";
    Serial.println(TUNER_NOTE);
  }
  if ((half_steps_from_A1 % 12) == 6){
    TUNER_NOTE = "D# / Eb";
    Serial.println(TUNER_NOTE);
  }
  if ((half_steps_from_A1 % 12) == 7){
    TUNER_NOTE = "E";
    Serial.println(TUNER_NOTE);
  }
  if ((half_steps_from_A1 % 12) == 8){
    TUNER_NOTE = "F";
    Serial.println(TUNER_NOTE);
  }
  if ((half_steps_from_A1 % 12) == 9){
    TUNER_NOTE = "F# / Gb";
    Serial.println(TUNER_NOTE);
  }
  if ((half_steps_from_A1 % 12) == 10){
    TUNER_NOTE = "G";
    Serial.println(TUNER_NOTE);
  }
  if ((half_steps_from_A1 % 12) == 11){
    TUNER_NOTE = "G# / Ab";
    Serial.println(TUNER_NOTE);
  }
  
  //
  delay(500);
}


*/
void Tuner(){
    double vReal[SAMPLES];
    double vImag[SAMPLES];
    int half_steps_from_A1;
    unsigned long microSeconds;
    for(int i=0; i<SAMPLES; i++){
      microSeconds = micros();

      vReal[i]=analogRead(TUNER_PIN);
      vImag[i]=0;
      //Amplitude = analogRead(0);

      while(micros() < (microSeconds + samplingPeriod)){
        
      }
      
    }
    FFT.Windowing(vReal,SAMPLES, FFT_WIN_TYP_HAMMING, FFT_FORWARD);
    FFT.Compute(vReal, vImag, SAMPLES, FFT_FORWARD);
    FFT.ComplexToMagnitude(vReal, vImag, SAMPLES);

    double outputFrequency = FFT.MajorPeak(vReal, SAMPLES, SAMPLING_FREQUENCY);
    double realFrequency = outputFrequency * .98;

    TUNER_NUMBER = realFrequency;
    Serial.println("This is the real frquncy:");
    Serial.println(TUNER_NUMBER);

    //Frequency to Note Name conversion
    half_steps_from_A1 = (log(realFrequency/55)/log(1.05946));

    // Octave Calculation
    if ((realFrequency>OCT2Begin)&&(realFrequency<OCT3Begin)){
    octaveScale = 2; //Octave 2 is 2x greater than Octave 1
    }
    if ((realFrequency>OCT3Begin)&&(realFrequency<OCT4Begin)){
    octaveScale = 4; //Octave 3 is 4x greater than Octave 1
    }
    if ((realFrequency>OCT4Begin)&&(realFrequency<OCT5Begin)){
    octaveScale = 8; //Octave 4 is 8x greater than Octave 1
    }
    if ((realFrequency>OCT5Begin)&&(realFrequency<OCT6Begin)){
    octaveScale = 16; //Octave 4 is 8x greater than Octave 1
    }
    //Serial.println(octaveScale);
    for (int a = 0; a<12; a++){
    upperBound = 1.037*freqArray[a]*octaveScale;
    lowerBound = .973*freqArray[a]*octaveScale;
    lowRedStartBound = freqArray[a]*lowRedStartScale*octaveScale;
    lowRedBound = freqArray[a]*lowRedScale*octaveScale;
    lowYellowBound = freqArray[a]*lowYellowScale*octaveScale;
    greenBound = freqArray[a]*greenScale*octaveScale;
    highYellowBound = freqArray[a]*highYellowScale*octaveScale;
    highRedBound = freqArray[a]*highRedScale*octaveScale;

    //defaults
    //TUNER_NOTE = "C";
    //TUNER_COLOR = "GREEN";

    if ((realFrequency<upperBound)&&(realFrequency>lowerBound)){
      TUNER_NOTE = noteArray[a];
      Serial.println("This is the note:");
      Serial.println(noteArray[a]);
      if ((realFrequency>lowRedStartBound)&&(realFrequency<lowRedBound)){
        TUNER_COLOR = "LOW RED";
        Serial.println("LOW RED");
      }
      if ((realFrequency>lowRedBound)&&(realFrequency<lowYellowBound)){
        TUNER_COLOR = "LOW YELLOW";
        Serial.println("LOW YELLOW");
      }   
      if ((realFrequency>lowYellowBound)&&(realFrequency<greenBound)){
        TUNER_COLOR = "GREEN";
        Serial.println("GREEN");
      }
      if ((realFrequency>greenBound)&&(realFrequency<highYellowBound)){
        TUNER_COLOR = "HIGH YELLOW";
        Serial.println("HIGH YELLOW");
      }
      if ((realFrequency>highYellowBound)&&(realFrequency<highRedBound)){
        TUNER_COLOR = "HIGH RED";
        Serial.println("HIGH RED");
      }
    }
  }
}


void timerSetup()
{
   samplingPeriod = round(1000000*(1.0/SAMPLING_FREQUENCY));
   pinMode(4,INPUT);
  /*pinMode(interruptPin, OUTPUT);
  Timer1.initialize(1000); // 1 millisecond interval
  Timer1.attachInterrupt(ISR);*/
}