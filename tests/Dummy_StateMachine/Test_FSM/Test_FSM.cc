/******************************************************************************
 *
 * M O D E L
 *
 * NAME: Test_FSM
 *
 * Dummy Skeleton for State Machine generator testing
 *
 ******************************************************************************/

#define __EMC_CPP_BUILD 456

#include "Test_FSM/Test_FSM_def.hh"

#include <string>
#include <iostream>
using namespace std;

#include "Test_FSM/Test_Component/TEST.hh"

::Test_FSM::Test_Component::Test_Package::TEST* testClass;
bool initialized = false;

int ::Test_FSM::init() {
  if(initialized) {
    return -1;
  }
  testClass = new ::Test_FSM::Test_Component::Test_Package::TEST();
  initialized = true;
  return 0;
}

void ::Test_FSM::run() {
	 cout << "Running test" << endl;
	 // send some events to statemachine
	 testClass->process_event(new ::Test_FSM::Test_Component::Test_Package::TEST::mySignal2_event(false));
	 if(testClass->current_state != 3) {
		 cerr << "TEST is not in correct state (" << testClass->current_state << " instead of myState3)" << endl;
		 return;
	 }

	 testClass->process_event(new ::Test_FSM::Test_Component::Test_Package::TEST::mySignal2_event(false));
	 if(testClass->current_state != 3) {
		 cerr << "TEST is not in correct state (" << testClass->current_state << " instead of myState3)" << endl;
		 return;
	 }

	 testClass->process_event(new ::Test_FSM::Test_Component::Test_Package::TEST::mySignal1_event(false));
	 if(testClass->current_state != 4) {
		 cerr << "TEST is not in correct state (" << testClass->current_state << " instead of myState4)" << endl;
		 return;
	 }

	 testClass->process_event(new ::Test_FSM::Test_Component::Test_Package::TEST::mySignal1_event(false));
	 if(testClass->current_state != 0) {
		 cerr << "TEST is not in correct state (" << testClass->current_state << " instead of TERMINATE)" << endl;
		 return;
	 }
}

void ::Test_FSM::dispose() {
  delete testClass;
}


int main() {
  ::Test_FSM::init();
  ::Test_FSM::run();
  return 0;
}
