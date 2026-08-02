#include "JSONDoc.hpp"


void SerializeForTuner(float tunerNumber, String tunerNote, String tunerColor, char output[], int size)
{
  JsonDocument doc;
  doc["number"] = tunerNumber;
  doc["note"] = tunerNote;
  doc["color"] = tunerColor;
  serializeJson(doc, output, size);
  //serializeJson(doc, output);
 // Serial.println(output);

}

void SerializeForTunerString(float tunerNumber, String tunerNote, String tunerColor, String  output)
{
  JsonDocument doc;
  doc["number"] = tunerNumber;
  doc["note"] = tunerNote;
  doc["color"] = tunerColor;
  serializeJson(doc, output);

  //Serial.println(output);

}



void JsonExtractor(char input[], int size, int * effect, int * parameter1, int * parameter2)
{

  JsonDocument doc;
  DeserializationError error = deserializeJson(doc, input);

  if (error)
  {
    Serial.print("deserializeJson() returned ");
    Serial.println(error.c_str());
    *effect = 0;
    *parameter1 = 0;
    *parameter2 = 0;
    return;
  }

  int e = doc["effect"];
  int p1 = doc["parameter1"];
  int p2 = doc["parameter2"];
  *effect = doc["effect"];
  *parameter1 = doc["parameter1"];
  *parameter2 = doc["parameter2"];

  Serial.println("Json effect results:");
  Serial.println(e);
  Serial.println(p1);
  Serial.println(p2);
  return;
}