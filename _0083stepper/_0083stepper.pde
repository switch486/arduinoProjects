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
  stepperX.begin(0);
  stepperX.setHoldSignalMilis(30);
}

void loop()
{
  stepperX.stepC();
  stepperX.stepC();
  stepperX.stepC();
  stepperX.stepC();
  stepperX.stepC();
  stepperX.stepC();
  delay(1500);
  
  stepperX.stepCC();
  stepperX.stepCC();
  stepperX.stepCC();
  stepperX.stepCC();
  delay(1500);
        
  
}
