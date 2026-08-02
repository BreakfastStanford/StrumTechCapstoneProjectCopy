#include "DigitalEffects.hpp"

void SendEffect(int pickEffect, int analog1, int analog2){
  
  
  if(pickEffect == 0) 
  {
    Serial.println("Effect zero selected");
     digitalWrite(digitalpin1, LOW);
  digitalWrite(digitalpin2, LOW);
  }
  else if(pickEffect == 1)
  {
    Serial.println("Effect one selected");
 digitalWrite(digitalpin1, LOW);
  digitalWrite(digitalpin2, HIGH);
  }
  else if(pickEffect == 2)
  {
    Serial.println("Effect two selected");
 digitalWrite(digitalpin1, HIGH);
  digitalWrite(digitalpin2, LOW);
  }
  else if(pickEffect == 3)
  {
    Serial.println("Effect three selected");
 digitalWrite(digitalpin1, HIGH);
  digitalWrite(digitalpin2, HIGH);
  }

 // digitalWrite(digitalpin1, pickEffect/2);
 // digitalWrite(digitalpin2, pickEffect%2);
/*
  analogWrite(analogpin1, analog1);
  analogWrite(analogpin2, analog2);
  */
}




void DigitalEffectsSetup()
{
  Serial.print("Digital effects setup");
  pinMode(digitalpin1, OUTPUT);
  pinMode(digitalpin2, OUTPUT);
}


