/*
#ifndef GUITAR_DISPLAY_PIXELS
#define GUITAR_DISPLAY_PIXELS
#include <Adafruit_NeoPixel.h>
#include "Arduino.h"

#define LED_PIN    5
#define LED_COUNT 30
#define ON 255
#define OFF 0
#define NO_USE 0

const int arraySize = 24; // Size of the array
Adafruit_NeoPixel pixels(LED_COUNT, LED_PIN, NEO_GRB + NEO_KHZ800);

//Major Chord Binary Strings

int Ab_Major[arraySize] =
{0, 0, 0, 0, 0, 0,
 0, 1, 1, 0, 0, 0,
 0, 0, 0, 1, 0, 0,
 1, 0, 0, 0, 1, 1};

int A_Major[arraySize] =  
{0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 0, 0, 1, 1, 1, 0,
 0, 0, 0, 0, 0, 0};

int Bb_Major[arraySize] = 
{0, 0, 0, 0, 0, 0,
 0, 0, 1, 1, 1, 0,
 0, 0, 0, 0, 0, 0,
 0, 1, 0, 0, 0, 1};

int B_Major[arraySize] =
{0, 0, 1, 1, 1, 0,
 0, 0, 0, 0, 0, 0,
 0, 1, 0, 0, 0, 1,
 0, 0, 0, 0, 0, 0};

int C_Major[arraySize] =
{0, 0, 0, 0, 0, 0,
 0, 1, 0, 0, 0, 0,
 0, 0, 1, 0, 0, 0,
 0, 0, 0, 0, 1, 0};
 
int Db_Major[arraySize] =
{0, 0, 0, 0, 0, 0,
 0, 0, 1, 0, 0, 0,
 0, 0, 0, 0, 1, 0,
 0, 0, 0, 1, 0, 1};
 
int D_Major[arraySize] =
{0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 1, 0,
 0, 0, 0, 1, 0, 1,
 0, 0, 0, 0, 0, 0};

int Eb_Major[arraySize] =
{0, 0, 0, 0, 1, 0,
 0, 0, 0, 1, 0, 1,
 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0};

int E_Major[arraySize] =
{0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 0, 1, 1, 0, 0, 0,
 0, 0, 0, 1, 0, 0};

int F_Major[arraySize] =
{0, 0, 0, 0, 0, 0,
 0, 1, 1, 0, 0, 0,
 0, 0, 0, 1, 0, 0,
 1, 0, 0, 0, 1, 1};

int Gb_Major[arraySize] =
{0, 1, 1, 0, 0, 0,
 0, 0, 0, 1, 0, 0,
 1, 0, 0, 0, 1, 1,
 0, 0, 0, 0, 0, 0};

int G_Major[arraySize] =
{0, 0, 0, 0, 0, 0,
 1, 0, 0, 0, 0, 1,
 0, 1, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0};

//Minor Chord Binary Strings
int Ab_Minor[arraySize] =
{1, 0, 0, 1, 1, 1,
 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0};

int A_Minor[arraySize] =
{0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 0, 0, 1, 1, 0, 0,
 0, 0, 0, 0, 1, 0};

int Bb_Minor[arraySize] =
{0, 0, 0, 0, 0, 0,
 0, 0, 1, 1, 0, 0,
 0, 0, 0, 0, 1, 0,
 0, 1, 0, 0, 0, 1};

int B_Minor[arraySize] =
{0, 0, 1, 1, 0, 0,
 0, 0, 0, 0, 1, 0,
 0, 1, 0, 0, 0, 1,
 0, 0, 0, 0, 0, 0};
 
int C_Minor[arraySize] =
{0, 0, 0, 0, 1, 0,
 0, 1, 0, 0, 0, 1,
 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0};
 
int Db_Minor[arraySize] =
{0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 0, 0, 1, 0, 1, 0,
 0, 0, 0, 1, 0, 0};
 
int D_Minor[arraySize] =
{0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 1, 0,
 0, 0, 0, 1, 0, 0,
 0, 0, 0, 0, 0, 1};
 
int Eb_Minor[arraySize] =
{0, 0, 1, 0, 1, 0,
 0, 0, 0, 1, 0, 0,
 0, 0, 0, 0, 0, 1,
 0, 0, 0, 0, 0, 0};
 
int E_Minor[arraySize] =
{0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 0, 1, 1, 0, 0, 0,
 0, 0, 0, 0, 0, 0};
 
int F_Minor[arraySize] =
{0, 0, 0, 0, 0, 0,
 0, 1, 1, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 1, 0, 0, 1, 1, 1};
 
int Gb_Minor[arraySize] =
{0, 1, 1, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 1, 0, 0, 1, 1, 1,
 0, 0, 0, 0, 0, 0};

int G_Minor[arraySize] =
{0, 0, 0, 0, 0, 0,
 1, 0, 0, 1, 1, 1,
 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0};
 
//7 Chord Binary Strings
int Ab_7[arraySize] =
{0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 1,
 0, 0, 1, 1, 1, 0};
 
int A_7[arraySize] =
{0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 1,
 0, 0, 1, 1, 1, 0,
 0, 0, 0, 0, 0, 0};

int Bb_7[arraySize] =
{0, 0, 0, 0, 0, 1,
 0, 0, 1, 1, 1, 0,
 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0};

int B_7[arraySize] =
{0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 0, 1, 0, 1, 0, 1,
 0, 0, 1, 0, 0, 0};
 
int C_7[arraySize] =
{0, 0, 0, 0, 0, 0,
 0, 1, 0, 1, 0, 0,
 0, 0, 1, 0, 0, 0,
 0, 0, 0, 0, 1, 0};

int Db_7[arraySize] =
{0, 0, 0, 1, 0, 1,
 0, 0, 1, 0, 0, 0,
 0, 0, 0, 0, 1, 0,
 0, 0, 0, 0, 0, 0};
  
int D_7[arraySize] =
{0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 0, 0, 0, 1, 0, 1,
 0, 0, 0, 0, 1, 0};
 
int Eb_7[arraySize] =
{0, 0, 0, 0, 0, 0,
 0, 0, 0, 1, 0, 1,
 0, 0, 0, 0, 1, 0,
 0, 0, 1, 0, 0, 0};
 
int E_7[arraySize] =
{0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 1, 0,
 0, 1, 1, 0, 0, 0,
 0, 0, 0, 1, 0, 0};
 
int F_7[arraySize] =
{0, 0, 0, 0, 0, 0,
 0, 1, 0, 0, 0, 0,
 0, 0, 0, 1, 0, 0,
 1, 0, 1, 0, 1, 1};

int Gb_7[arraySize] =
{0, 0, 1, 0, 0, 0,
 0, 0, 0, 1, 0, 0,
 0, 0, 0, 0, 1, 0,
 0, 0, 0, 0, 0, 0};

int G_7[arraySize] =
{0, 0, 0, 0, 0, 0,
 1, 0, 0, 0, 0, 0,
 0, 1, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 1};
//Special Strings
int Clear[arraySize] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
/*
int Clear[arraySize] = 
{0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0};
 *
int programArray[arraySize];

void DisplayNeoPixels();
void AssignChord(String inputChord);

//Additional Chords
//Helper Function Prototypes
void InputChord();
void pixelsSetup();
void TurnOffPixels();


#endif // GUITAR_DISPLAY_PIXELS
*/

#ifndef GUITAR_DISPLAY_PIXELS
#define GUITAR_DISPLAY_PIXELS
#include <Adafruit_NeoPixel.h>
#include "Arduino.h"

#define LED_PIN    8
#define LED_COUNT 36
#define ON 255
#define OFF 0
#define NO_USE 0

const int arraySize = 36; // Size of the array
Adafruit_NeoPixel pixels(LED_COUNT, LED_PIN, NEO_GRB + NEO_KHZ800);

//Major Chord Binary Strings

int Ab_Major[arraySize] =
{0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,
 0, 3, 4, 0, 0, 0,
 0, 0, 0, 2, 0, 0,
 1, 1, 1, 1, 1, 1};

int A_Major[arraySize] =  
{5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
 5, 0, 0, 0, 0, 0,
 5, 0, 1, 1, 1, 0,
 5, 0, 0, 0, 0, 0};

int Bb_Major[arraySize] = 
{5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
 5, 0, 3, 3, 3, 0,
 5, 0, 0, 0, 0, 0,
 5, 1, 1, 1, 1, 1};

int B_Major[arraySize] =
{5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
5, 0, 3, 3, 3, 0,
 5, 0, 0, 0, 0, 0,
 5, 1, 1, 1, 1, 1,
 5, 0, 0, 0, 0, 0};

int C_Major[arraySize] =
{5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
 5, 3, 0, 0, 0, 0,
 5, 0, 2, 0, 0, 0,
 5, 0, 0, 0, 1, 0};
 
int Db_Major[arraySize] =
{5, 0, 3, 3, 3, 0,
5, 0, 0, 0, 0, 0,
5, 1, 1, 1, 1, 1,
 5, 0, 0, 0, 0, 0,
 5, 0, 0, 0, 0, 0,
 5, 0, 0, 0, 0, 0};
 
int D_Major[arraySize] =
{5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
 5, 0, 0, 0, 3, 0,
 5, 0, 0, 1, 0, 2,
 5, 0, 0, 0, 0, 0};

int Eb_Major[arraySize] =
{5, 3, 0, 0, 0, 4,
5, 0, 2, 0, 0, 0,
5, 0, 0, 0, 1, 0,
 5, 0, 0, 0, 0, 0,
 5, 0, 0, 0, 0, 0,
 5, 0, 0, 0, 0, 0};

int E_Major[arraySize] =
{0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 0, 2, 3, 0, 0, 0,
 0, 0, 0, 1, 0, 0};

int F_Major[arraySize] =
{0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,
 0, 3, 4, 0, 0, 0,
 0, 0, 0, 2, 0, 0,
 1, 1, 1, 1, 1, 1};

int Gb_Major[arraySize] =
{0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,
0, 3, 4, 0, 0, 0,
 0, 0, 0, 2, 0, 0,
 1, 1, 1, 1, 1, 1,
 0, 0, 0, 0, 0, 0};

int G_Major[arraySize] =
{0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,
 3, 0, 0, 0, 0, 4,
 0, 2, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0};

//Minor Chord Binary Strings
int Ab_Minor[arraySize] =
{0, 3, 4, 0, 0, 0,
0, 0, 0, 0, 0, 0,
1, 1, 1, 1, 1, 1,
 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0};

int A_Minor[arraySize] =
{5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
 5, 0, 0, 0, 0, 0,
 5, 0, 2, 3, 0, 0,
 5, 0, 0, 0, 1, 0};

int Bb_Minor[arraySize] =
{5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
 5, 0, 3, 4, 0, 0,
 5, 0, 0, 0, 2, 0,
 5, 1, 1, 1, 1, 1};

int B_Minor[arraySize] =
{5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
5, 0, 3, 4, 0, 0,
 5, 0, 0, 0, 2, 0,
 5, 1, 1, 1, 1, 1,
 5, 0, 0, 0, 0, 0};
 
int C_Minor[arraySize] =
{5, 0, 0, 0, 0, 0,
5, 0, 3, 4, 0, 0,
5, 0, 0, 0, 2, 0,
 5, 1, 1, 1, 1, 1,
 5, 0, 0, 0, 0, 0,
 5, 0, 0, 0, 0, 0};
 
int Db_Minor[arraySize] =
{5, 0, 3, 4, 0, 0,
5, 0, 0, 0, 2, 0,
5, 1, 1, 1, 1, 1,
 5, 0, 0, 0, 0, 0,
 5, 0, 0, 0, 0, 0,
 5, 0, 0, 0, 0, 0};
 
int D_Minor[arraySize] =
{5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
 5, 0, 0, 0, 3, 0,
 5, 0, 0, 2, 0, 0,
 5, 0, 0, 0, 0, 1};
 
int Eb_Minor[arraySize] =
{5, 1, 1, 1, 1, 1,
5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
 5, 0, 0, 0, 0, 0,
 5, 0, 0, 0, 0, 0,
 5, 0, 0, 0, 0, 0};
 
int E_Minor[arraySize] =
{0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 0, 2, 3, 0, 0, 0,
 0, 0, 0, 0, 0, 0};
 
int F_Minor[arraySize] =
{0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,
 0, 3, 4, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 1, 1, 1, 1, 1, 1};
 
int Gb_Minor[arraySize] =
{0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,
0, 3, 4, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 1, 1, 1, 1, 1, 1,
 0, 0, 0, 0, 0, 0};

int G_Minor[arraySize] =
{0, 0, 0, 0, 0, 0,
0, 3, 4, 0, 0, 0,
0, 0, 0, 0, 0, 0,
 1, 1, 1, 1, 1, 1,
 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0};
 
//7 Chord Binary Strings
int Ab_7[arraySize] =
{0, 0, 5, 0, 0, 0,
0, 0, 5, 0, 0, 0,
2, 0, 5, 0, 3, 3,
 0, 1, 5, 0, 0, 0,
 0, 0, 5, 0, 0, 0,
 0, 0, 5, 0, 0, 0};
 
int A_7[arraySize] =
{5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
 5, 0, 0, 0, 0, 0,
 5, 0, 2, 0, 3, 0,
 5, 0, 0, 0, 0, 0};

int Bb_7[arraySize] =
{5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
 5, 0, 3, 0, 4, 0,
 5, 0, 0, 0, 0, 0,
 5, 1, 1, 1, 1, 1};

int B_7[arraySize] =
{5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
 5, 0, 0, 0, 0, 0,
 5, 2, 0, 3, 0, 4,
 5, 0, 1, 0, 0, 0};
 
int C_7[arraySize] =
{5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
 5, 3, 0, 4, 0, 0,
 5, 0, 2, 0, 0, 0,
 5, 0, 0, 0, 1, 0};

int Db_7[arraySize] =
{5, 0, 3, 0, 4, 0,
5, 0, 0, 2, 0, 0,
5, 1, 1, 1, 1, 1,
 5, 0, 0, 0, 0, 0,
 5, 0, 0, 0, 0, 0,
 5, 0, 0, 0, 0, 0};
  
int D_7[arraySize] =
{5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
5, 0, 0, 0, 0, 0,
 5, 0, 0, 0, 0, 0,
 5, 0, 0, 2, 0, 3,
 5, 0, 0, 0, 1, 0};
 
int Eb_7[arraySize] =
{5, 3, 0, 4, 0, 5,
5, 0, 2, 0, 0, 5,
5, 0, 0, 0, 1, 5,
 5, 0, 0, 0, 0, 5,
 5, 0, 0, 0, 0, 5,
 5, 0, 0, 0, 0, 5};
 
int E_7[arraySize] =
{0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 0, 2, 0, 0, 0, 0,
 0, 0, 0, 1, 0, 0};
 
int F_7[arraySize] =
{0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,
 0, 3, 0, 0, 0, 0,
 0, 0, 0, 2, 0, 0,
 1, 1, 1, 1, 1, 1};

int Gb_7[arraySize] =
{5, 5, 0, 0, 0, 0,
5, 5, 0, 0, 0, 0,
5, 5, 4, 0, 0, 0,
 5, 5, 0, 3, 0, 0,
 5, 5, 0, 0, 2, 0,
 5, 5, 0, 0, 0, 1};

int G_7[arraySize] =
{0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0,
 3, 0, 0, 0, 0, 0,
 0, 2, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 1};
//Special Strings
int Clear[arraySize] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
/*
int Clear[arraySize] = 
{0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0};
 */
int programArray[arraySize];

void DisplayNeoPixels();
void AssignChord(String inputChord);

//Additional Chords
//Helper Function Prototypes
void InputChord();
void pixelsSetup();
void TurnOffPixels();


#endif // GUITAR_DISPLAY_PIXELS