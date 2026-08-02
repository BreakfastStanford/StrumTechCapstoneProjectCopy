#include "GuitarStateMachine.hpp"
#include "JSONDoc.hpp"

void GuitarSetup()
{
  timerSetup();
  pixelsSetup();
  DigitalEffectsSetup();
  Serial.println("Guitar setup exiting");
}

/*
- if the nextmode == no_mode ~ bottom
  - return and do nothing
- if nextMode != noMOde and currentMode == No_mode ~ second bottom
  - new guitar state
- if nextMode == currentmode and currentMode != No_mode
  - cont guitarstate
- if nextMode != currentMOde and currentMode != No_mode and nextNode != No mode
  - move to exit
  - move to new

*/


/* determines which mode to switch to and handles the switching logic*/
void ExecuteCurrentMode()
{
  Serial.println("Current Mode: ");
  Serial.println((int)CURRENT_MODE_SETTINGS);
  NEXT_MODE_SETTINGS = CheckifBluetoothRecievedModeData(CURRENT_MODE_SETTINGS);

  int nextMode = NEXT_MODE_SETTINGS;
  int currentMode = CURRENT_MODE_SETTINGS;

  if(nextMode == currentMode && currentMode != NO_MODE)
  {
    GUITAR_STATE_PROGRESS = GUITAR_STATE_CONT;
    SwitchToMode(currentMode);
  }
  else if (nextMode != currentMode && currentMode != NO_MODE && nextMode != NO_MODE)
  {
    GUITAR_STATE_PROGRESS = GUITAR_STATE_EXIT;
    SwitchToMode(currentMode);

    GUITAR_STATE_PROGRESS = GUITAR_STATE_NEW;
    NewModeInit(nextMode);
    SwitchToMode(nextMode);
    
  }
  else if (currentMode == NO_MODE && nextMode != NO_MODE )
  {
    GUITAR_STATE_PROGRESS = GUITAR_STATE_NEW;
    NewModeInit(nextMode);
    SwitchToMode(nextMode);
  }
  else if (nextMode == NO_MODE)
  {
    // nextMode == NO_MODE DO NOTHING just delay

  }

  
  
}


/**** State machine ***/ 
// new is first arrival into setup
//cont is still in the same mode
// exit, is cleanup used for the next mode


// handles the switching to the different modes
void SwitchToMode(int mode)
{

  if(mode == CHORDS_MODE_SETTING)
  {
    ChordModeState();
  }
  else if (mode == TUNER_MODE_SETTING)
  {
    TunerModeState();
  }
  else if (mode == FREE_MODE_SETTIING)
  {
    FreeModeState();
  }
}


void FreeModeState()
{
  
  if(GUITAR_STATE_PROGRESS == GUITAR_STATE_NEW)
  {
    // something upon entry

  }
  else if (GUITAR_STATE_PROGRESS == GUITAR_STATE_CONT) 
  {
    int size = 128;
    char inputC[size];
    int effect = 0;
    int parameter1 = 0;
    int parameter2 = 0;

    if (BluetoothRecievedDigiEffectData(inputC, size))
    {
      Serial.println("effect data recieved");
      JsonExtractor(inputC, size, &effect, &parameter1, &parameter2);
      SendEffect(effect, parameter1, parameter2);
    }

  }
  else if (GUITAR_STATE_PROGRESS  == GUITAR_STATE_EXIT) 
  {
   // SendEffect(0, 0, 0);
  }
  
}


/*
Tuner should be able to detect when a note isn't strummed
and simply return the previous value....unless this is in the new state, then it returns and sends....?
*/

void TunerModeState()
{
  String output;
  int size = 128;
  char outputC[size];
  //int size = sizeof(output) / sizeof(char);// maybe uneeded
  if(GUITAR_STATE_PROGRESS == GUITAR_STATE_NEW )
  {
   
  }
  else if(GUITAR_STATE_PROGRESS == GUITAR_STATE_CONT)
  {
    Tuner();
    //remove later
    
    SerializeForTuner(TUNER_NUMBER,TUNER_NOTE, TUNER_COLOR, outputC, size);
   // Serial.println("Tuner Json:");
    Serial.println(outputC);
    BluetoothSendTunerDataJSONCString(outputC);
  }
  else if (GUITAR_STATE_PROGRESS  == GUITAR_STATE_EXIT) 
  {

  }
}




void ChordModeState()
{

  if(GUITAR_STATE_PROGRESS == GUITAR_STATE_NEW)
  {

  }
  else if (GUITAR_STATE_PROGRESS == GUITAR_STATE_CONT) 
  {
    Characteristic_chord = BluetoothRecievedChordData();
    if(Characteristic_chord == "")
    {
      return;
    }
    AssignChord(Characteristic_chord);
    DisplayNeoPixels();
    Characteristic_chord = "";
  }
  else if (GUITAR_STATE_PROGRESS  == GUITAR_STATE_EXIT) 
  {
    TurnOffPixels();
  }
}


// send the control signal
// signal to the user that the mode changed... slight delay
void NewModeInit(int mode)
{

  // send control signal
  // detect mode
  IndicateChordModeWithLights(mode);
 

  // control signal flag not read
  //while (!ISCONTROLSIGNALFLAGREAD)
 // /{
    BluetoothSendControlData(mode);
  //  delay(2000);
 // }
  
  //control signal flag read
  TurnOffLightIndication();
  ISCONTROLSIGNALFLAGREAD = false;
}

void IndicateChordModeWithLights(int mode)
{

}


void TurnOffLightIndication()
{

}

