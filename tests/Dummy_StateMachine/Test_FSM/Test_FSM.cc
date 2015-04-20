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

#include "Test_FSM/Main_Package/Test_Component/TEST.hh"

::Test_FSM::Main_Package::Test_Component::Test_Package::TEST* testClass;
bool initialized = false;

int ::Test_FSM::init() {
  if(initialized) {
    return -1;
  }
  testClass = new ::Test_FSM::Main_Package::Test_Component::Test_Package::TEST();
  initialized = true;
  return 0;
}

void ::Test_FSM::run() {
	 cout << "Running test" << endl;
	 // send some events to statemachine
	 testClass->processEvent(0 /* TEST_EVENT_WORK */ , "valid");
	 if(testClass->current_state != 1) {
		 cerr << "TEST is not in correct state (" << testClass->current_state << " instead of WORK)" << endl;
		 return;
	 }

	 testClass->processEvent(2 /* TEST_EVENT_NOP */, "valid");
	 if(testClass->current_state != 1) {
		 cerr << "TEST is not in correct state (" << testClass->current_state << " instead of WORK)" << endl;
		 return;
	 }

	 testClass->processEvent(1 /* TEST_EVENT_DONE */, "valid");
	 if(testClass->current_state != 0) {
		 cerr << "TEST is not in correct state (" << testClass->current_state << " instead of INIT)" << endl;
		 return;
	 }

	 testClass->processEvent(2 /* TEST_EVENT_NOP */, "valid");
	 if(testClass->current_state != 0) {
		 cerr << "TEST is not in correct state (" << testClass->current_state << " instead of INIT)" << endl;
		 return;
	 }

	 testClass->processEvent(0 /* TEST_EVENT_WORK */, "invalid");
	 if(testClass->current_state != 0) {
		 cerr << "TEST is not in correct state (" << testClass->current_state << " instead of INIT)" << endl;
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
