#include "PCF8574.h"
#include <Wire.h>

PCF8574 expander1;
PCF8574 expander2;

void setup()
{
  expander1.begin(0x38);
  expander2.begin(0x20);
  expander1.pinMode(4, OUTPUT);
    expander2.pinMode(4, OUTPUT);
}

void loop()
{
  expander1.digitalWrite(4, LOW);
  delay(500);
  expander2.digitalWrite(4, LOW);
  delay(500);
  expander1.digitalWrite(4, HIGH);
  delay(500);
  expander2.digitalWrite(4, HIGH);
  delay(500);
  
}
