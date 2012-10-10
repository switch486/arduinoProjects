/**
 * @author switch486
 * @licensed under CC BY-SA
 * NOTE - this does not consider the libraries 'included' in this class
 * @version 1.0
 * @see http://hardwareblacksmith.blogspot.com/
 * 
 * This is a header class of the KT42JM stepper motor driver.
 *
 */
#ifndef KT42JM_H
#define KT42JM_H

#include <WProgram.h>
#include "PCF8574.h"

typedef void (*FunctionPointer)(void);

class KT42JM {
public:
        KT42JM();
        ~KT42JM();
	void begin (int no);
        void setHoldSignalMilis (int timeInMilis);
        void setState (int stateToBeResetted);
        void resetState ();
        void resetState (int stateToBeResetted);
        void incrementStateIterator ();
        void decrementStateIterator ();
	void stepC ();
        void stepCC ();
private:
	void init ();	
        void stepp ();
};
 

#endif
