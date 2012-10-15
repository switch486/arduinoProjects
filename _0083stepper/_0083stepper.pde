/**
 * @author switch486
 * @licensed under CC BY-SA
 * NOTE - this does not consider the libraries 'included' in this class
 * @version 1.0
 * @see http://hardwareblacksmith.blogspot.com/
 * 
 */
#include "KT42JM.h"
#include <Wire.h>

KT42JM stepperX;

void setup()
{ 
  stepperX.begin(0x38);
  stepperX.setHoldSignalMilis(40);
  
//  Serial.begin(9600);
//  Serial.println("Hello world");
//  delay(1000);// Give reader a chance to see the output.
}

void loop()
{
  for (int i=0; i<600; i++) {
    stepperX.stepC();
  }
  delay(500);
  
  for (int i=0; i<300; i++) {
    stepperX.stepCC();
  }
        
  
}
