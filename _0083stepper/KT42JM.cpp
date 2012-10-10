/**
 * @author switch486
 * @licensed under CC BY-SA
 * NOTE - this does not consider the libraries 'included' in this class
 * @version 1.0
 * @see http://hardwareblacksmith.blogspot.com/
 * 
 * This is a wrapper for the PCF8574 (Wire too) class handling the i2c bus.
 *
 * This stepper motor driver part is designed to work with the stepper driver 
 * presented in this blog post: 
 * http://hardwareblacksmith.blogspot.com/2012/01/stepper-driver-v10.html
 *
 * Feel free to get in touch with me in case of questions.
 *
 */
#include "KT42JM.h"
#include "PCF8574.h"

PCF8574 expander;
int timeToSleepInMilis = 30;
int stateTable[6][2] = {{0, 4},
                        {2, 4},
                        {2, 5}, 
                        {1, 5}, 
                        {1, 3}, 
                        {0, 3}};
int stateIterator = 0;
int STEPPER_MOTOR_STATES = 6;
int VALUES_PER_STEP = 2;

KT42JM::KT42JM(){
  /* DO NOTHING */
}

KT42JM::~KT42JM(){
  /* DO NOTHING */
}

void KT42JM::begin(int no){
  expander.begin(0x38 + no);
  resetState();
}

void KT42JM::setHoldSignalMilis(int timeInMilis) {
  timeToSleepInMilis = timeInMilis;
}

void KT42JM::resetState() {
  for (int i=0; i<STEPPER_MOTOR_STATES ; i++) {
    expander.digitalWrite(i, LOW);
  }
}

void KT42JM::resetState (int stateToBeResetted) {
  for (int i=0; i<VALUES_PER_STEP ; i++) {
     expander.digitalWrite(stateTable[stateToBeResetted][i], LOW);
  }
}

void KT42JM::setState (int stateToBeResetted) {
  for (int i=0; i<VALUES_PER_STEP ; i++) {
    expander.digitalWrite(stateTable[stateToBeResetted][i], HIGH);
  }
}

/**
 * clockwise
 */
void KT42JM::stepC() {
  stepp();
  incrementStateIterator();
}

void KT42JM::stepCC() {
  stepp();
  decrementStateIterator();
}

void KT42JM::stepp() {
  setState(stateIterator);
  delay(timeToSleepInMilis);
  //reset state - save power and transistors
  resetState(stateIterator);
}

void KT42JM::incrementStateIterator() {
  stateIterator++;
  stateIterator %=STEPPER_MOTOR_STATES;
}

void KT42JM::decrementStateIterator() {
  stateIterator--;
  stateIterator %=STEPPER_MOTOR_STATES;
}
