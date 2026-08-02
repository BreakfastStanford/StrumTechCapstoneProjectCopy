#include "ControlData.hpp"
  // sets mode data for next run
  void SetModeData()
  {
    CURRENT_MODE_SETTINGS = NEXT_MODE_SETTINGS;
  }

  enum ControlModes MapToMode(int mode)
  {
    if (mode == FREE_MODE_SETTIING)
    {
      return FREE_MODE_SETTIING;
    }
    else if (mode == TUNER_MODE_SETTING)
    {
      return TUNER_MODE_SETTING;
    } 
    else if (mode == CHORDS_MODE_SETTING)
    {
      return CHORDS_MODE_SETTING;
    }
    else 
    {
      return NO_MODE;
    }

  }