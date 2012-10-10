#include "PCF8574.h"
#include <Wire.h>

PCF8574 expander1;
PCF8574 expander2;
PCF8574 expander3;
PCF8574 expander4;

void setup()
{
  expander1.begin(0x38);
  expander2.begin(0x39);
  expander3.begin(0x3A);
  expander4.begin(0x3B);
  expander1.pinMode(4, OUTPUT);
  expander2.pinMode(4, OUTPUT);
  expander3.pinMode(4, OUTPUT);
  expander4.pinMode(4, OUTPUT);
}

boolean state = false;

int getState() {
 return state ? HIGH : LOW;
}

void loop()
{
  
  expander1.digitalWrite(4, getState());
  delay(500);
  expander2.digitalWrite(4, getState());
  delay(500);
  expander3.digitalWrite(4, getState());
  delay(500);
  expander4.digitalWrite(4, getState());
  delay(500);
  
  state = !state;
  
}
