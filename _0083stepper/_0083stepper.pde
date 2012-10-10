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
  stepperX.setHoldSignalMilis(1000);
  
//  Serial.begin(9600);
//  Serial.println("Hello world");
//  delay(1000);// Give reader a chance to see the output.
//  stepperX.stepC();
//  stepperX.stepC();
//  stepperX.stepC();
//  stepperX.stepC();
//  stepperX.stepC();
//  stepperX.stepC();
//  stepperX.stepC();
//  stepperX.stepC();
}

void loop()
{
  stepperX.stepC();
//  stepperX.stepC();
//  stepperX.stepC();
//  stepperX.stepC();
//  stepperX.stepC();
//  stepperX.stepC();
//  delay(1500);
//  
//  stepperX.stepCC();
//  stepperX.stepCC();
//  stepperX.stepCC();
//  stepperX.stepCC();
//  delay(1500);
        
  
}
