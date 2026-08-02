/*
#include "PixelLibrary.hpp"

/* output of lights *
void DisplayNeoPixels(){//This function runs through the chosen binary string and lights up the proper LEDs
  for (int i = 0; i < arraySize; i++) {
    if(programArray[i] == 1){
      pixels.setPixelColor(i,pixels.Color(OFF,ON,OFF));
      pixels.show();
    }
    if(programArray[i] == 0){
      pixels.setPixelColor(i,pixels.Color(OFF,OFF,OFF));
      pixels.show();
    }
  }
}

void TurnOffPixels()
{
 for (int i = 0; i < arraySize; i++)
  { 
      pixels.setPixelColor(i,pixels.Color(OFF,OFF,OFF));
      pixels.show();
    
  }
}

void AssignChord(String inputChord){//This function takes the inputted chord and determines which binary string to display
  if(inputChord == "Ab"){//Ab Major //test
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = A_Major[i];
    }
  }
  if(inputChord == "A"){//A Major
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = A_Major[i];
    }
  }
  if(inputChord == "Bb"){//Bb Major
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Bb_Major[i];
    }
  }
  if(inputChord == "B"){//B Major
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = B_Major[i];
    }
  }
  if(inputChord == "C"){//C Major
    for (int i = 0; i < arraySize; i++) {
      Serial.println("C was called");
    programArray[i] = C_Major[i];
    }
  }
  if(inputChord == "Db"){//Db Major
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Db_Major[i];
    }
  }
  if(inputChord == "D"){//D Major
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = D_Major[i];
    }
  }
  if(inputChord == "Eb\n"){//Eb Major
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Eb_Major[i];
    }
  }
  if(inputChord == "E"){//E Major
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = E_Major[i];
    }
  }
  if(inputChord == "F"){//F Major
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = F_Major[i];
    }
  }
  if(inputChord == "Gb"){//Gb Major
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Gb_Major[i];
    }
  }
  if(inputChord == "G"){//G Major
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = G_Major[i];
    }
  }
  if(inputChord == "Abm"){//Ab Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Ab_Minor[i];
    }
  }
  if(inputChord == "Am"){//A Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = A_Minor[i];
    }
  }
  if(inputChord == "Bbm\n"){//Bb Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Bb_Minor[i];
    }
  }
  if(inputChord == "Bm\n"){//B Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = B_Minor[i];
    }
  }
  if(inputChord == "Cm"){//C Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = C_Minor[i];
    }
  }
  if(inputChord == "Dbm\n"){//Db Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Db_Minor[i];
    }
  }
  if(inputChord == "Dm\n"){//D Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = D_Minor[i];
    }
  }
  if(inputChord == "Ebm"){//Eb Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Eb_Minor[i];
    }
  }
  if(inputChord == "Em"){//E Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = E_Minor[i];
    }
  }
  if(inputChord == "Fm"){//F Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = F_Minor[i];
    }
  }
  if(inputChord == "Gbm\n"){//Gb Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Gb_Minor[i];
    }
  }
  if(inputChord == "Gm\n"){//G Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = G_Minor[i];
    }
  }
  if(inputChord == "Ab7\n"){//Ab7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Ab_7[i];
    }
  }
  if(inputChord == "A7"){//A7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = A_7[i];
    }
  }
  if(inputChord == "Bb7"){//Bb7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Bb_7[i];
    }
  }
  if(inputChord == "B7"){//B7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = B_7[i];
    }
  }
  if(inputChord == "C7"){//C7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = C_7[i];
    }
  }
  if(inputChord == "Db7"){//Db7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Db_7[i];
    }
  }
  if(inputChord == "D7"){//D7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = D_7[i];
    }
  }
  if(inputChord == "Eb7"){//Eb7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Eb_7[i];
    }
  }
  if(inputChord == "E7"){//E7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = E_7[i];
    }
  }
  if(inputChord == "F7\n"){//F7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = F_7[i];
    }
  }
  if(inputChord == "Gb7"){//Gb7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Gb_7[i];
    }
  }
  if(inputChord == "G7"){//G7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = G_7[i];
    }
  }
  //Insert More Chords Here
  if(inputChord == "n\n"){//Clear
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Clear[i];
    }
  }
}

void pixelsSetup()
{
  pixels.begin();      
  pixels.show();  
}
*/


#include "PixelLibrary.hpp"

/* output of lights */
void DisplayNeoPixels(){//This function runs through the chosen binary string and lights up the proper LEDs
  for (int i = 0; i < arraySize; i++) {
    if(programArray[i] == 5){
      pixels.setPixelColor(i,pixels.Color(ON,OFF,OFF)); //Red
      pixels.show();
    }
    if(programArray[i] == 4){
      pixels.setPixelColor(i,pixels.Color(ON,OFF,ON)); // Purple
      pixels.show();
    }
    if(programArray[i] == 3){
      pixels.setPixelColor(i,pixels.Color(ON,ON,OFF)); // Yellow
      pixels.show();
    }
    if(programArray[i] == 2){
      pixels.setPixelColor(i,pixels.Color(OFF,OFF,ON)); // Blue
      pixels.show();
    }
    if(programArray[i] == 1){
      pixels.setPixelColor(i,pixels.Color(OFF,ON,OFF)); // Green
      pixels.show();
    }
    if(programArray[i] == 0){
      pixels.setPixelColor(i,pixels.Color(OFF,OFF,OFF)); // No Light
      pixels.show();
    }
  }
}

void TurnOffPixels()
{
 for (int i = 0; i < arraySize; i++)
  { 
      pixels.setPixelColor(i,pixels.Color(OFF,OFF,OFF));
      pixels.show();
    
  }
}

void AssignChord(String inputChord){//This function takes the inputted chord and determines which binary string to display
  if(inputChord == "Ab"){//Ab Major //test
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = A_Major[i];
    }
  }
  if(inputChord == "A"){//A Major
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = A_Major[i];
    }
  }
  if(inputChord == "Bb"){//Bb Major
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Bb_Major[i];
    }
  }
  if(inputChord == "B"){//B Major
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = B_Major[i];
    }
  }
  if(inputChord == "C"){//C Major
    for (int i = 0; i < arraySize; i++) {
      Serial.println("C was called");
    programArray[i] = C_Major[i];
    }
  }
  if(inputChord == "Db"){//Db Major
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Db_Major[i];
    }
  }
  if(inputChord == "D"){//D Major
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = D_Major[i];
    }
  }
  if(inputChord == "Eb"){//Eb Major
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Eb_Major[i];
    }
  }
  if(inputChord == "E"){//E Major
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = E_Major[i];
    }
  }
  if(inputChord == "F"){//F Major
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = F_Major[i];
    }
  }
  if(inputChord == "Gb"){//Gb Major
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Gb_Major[i];
    }
  }
  if(inputChord == "G"){//G Major
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = G_Major[i];
    }
  }
  if(inputChord == "Abm"){//Ab Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Ab_Minor[i];
    }
  }
  if(inputChord == "Am"){//A Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = A_Minor[i];
    }
  }
  if(inputChord == "Bbm"){//Bb Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Bb_Minor[i];
    }
  }
  if(inputChord == "Bm"){//B Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = B_Minor[i];
    }
  }
  if(inputChord == "Cm"){//C Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = C_Minor[i];
    }
  }
  if(inputChord == "Dbm"){//Db Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Db_Minor[i];
    }
  }
  if(inputChord == "Dm"){//D Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = D_Minor[i];
    }
  }
  if(inputChord == "Ebm"){//Eb Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Eb_Minor[i];
    }
  }
  if(inputChord == "Em"){//E Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = E_Minor[i];
    }
  }
  if(inputChord == "Fm"){//F Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = F_Minor[i];
    }
  }
  if(inputChord == "Gbm"){//Gb Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Gb_Minor[i];
    }
  }
  if(inputChord == "Gm"){//G Minor
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = G_Minor[i];
    }
  }
  if(inputChord == "Ab7"){//Ab7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Ab_7[i];
    }
  }
  if(inputChord == "A7"){//A7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = A_7[i];
    }
  }
  if(inputChord == "Bb7"){//Bb7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Bb_7[i];
    }
  }
  if(inputChord == "B7"){//B7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = B_7[i];
    }
  }
  if(inputChord == "C7"){//C7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = C_7[i];
    }
  }
  if(inputChord == "Db7"){//Db7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Db_7[i];
    }
  }
  if(inputChord == "D7"){//D7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = D_7[i];
    }
  }
  if(inputChord == "Eb7"){//Eb7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Eb_7[i];
    }
  }
  if(inputChord == "E7"){//E7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = E_7[i];
    }
  }
  if(inputChord == "F7"){//F7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = F_7[i];
    }
  }
  if(inputChord == "Gb7"){//Gb7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Gb_7[i];
    }
  }
  if(inputChord == "G7"){//G7
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = G_7[i];
    }
  }
  //Insert More Chords Here
  if(inputChord == "n\n"){//Clear
    for (int i = 0; i < arraySize; i++) {
    programArray[i] = Clear[i];
    }
  }
}

void pixelsSetup()
{
  pixels.begin();      
  pixels.show();  
}



