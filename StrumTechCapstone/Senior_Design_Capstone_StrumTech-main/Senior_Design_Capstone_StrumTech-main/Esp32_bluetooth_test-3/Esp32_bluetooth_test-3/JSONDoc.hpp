
#ifndef JSON_DOC
#define JSON_DOC
#include <ArduinoJson.h>


void SerializeForTuner(float tunerNumber, String tunerNote, String tunerColor, char output[], int size);
void SerializeForTunerString(float tunerNumber, String tunerNote, String tunerColor, String output);

void JsonExtractor(char input[], int size, int * effect, int * parameter1, int * parameter2);
#endif //JSON_DOC