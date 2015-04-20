/******************************************************************************
 *
 * O B J E C T   C L A S S   ( B O D Y )
 *
 * NAME: Test Class
 *
 * NUMBER: 1
 *
 * KEY LETTERS: TEST
 *
 *
 * Dummy Skeleton for State Machine generator testing
 *
 ******************************************************************************/

#define __EMC_CPP_BUILD 456

#include "TEST.hh"
#include <iostream>
using namespace std;

#include "Test_FSM/Main_Package/Test_Component/Test_Component_def.hh"

using namespace ::Test_FSM::Main_Package::Test_Component::Test_Package;

// Constructor
TEST::TEST(): current_state(TEST_STATE_INIT) {
}

// Destructor
TEST::~TEST() {
}

void TEST::processEvent(int eventId, std::string eventContent) {
	cout << "[TEST] Event " << eventId << " received with content: " << eventContent << endl;

	switch(current_state){
	case TEST_STATE_INIT:
		processEventInInitState(eventId, eventContent);
		break;
	case TEST_STATE_WORKING:
		processEventInWorkingState(eventId, eventContent);
		break;
	}
}

void TEST::processEventInInitState(int eventId, std::string eventContent) {
	cout << "  [State: INIT] Processing event" << endl;

	bool processableEvent = false;
	switch(eventId){
	case TEST_EVENT_WORK:
		processableEvent = true;
		break;
	case TEST_EVENT_DONE:
		// NOT PROCESSABLE
		break;
	case TEST_EVENT_NOP:
		processableEvent = true;
		break;
	}

	if(!processableEvent){
		cout << "    Cannot process event in this state" << endl;
	} else {
		// Init -WORK-> Work transition
		if(eventId == TEST_EVENT_WORK && evaluateGuardOnInitToWorkingTransition(eventId, eventContent)){
			current_state = TEST_STATE_WORKING;
			cout << "    State changed to WORKING" << endl;
		} else if(eventId == TEST_EVENT_NOP) {
			cout << "    No state change on NOP" << endl;
		}
	}

	return;
}

bool TEST::evaluateGuardOnInitToWorkingTransition(int eventId, std::string eventContent) {
	if(eventContent == "valid") {
		return true;
	} else {
		cout << "    [-> WORKING] Invalid content, guard false" << endl;
		return false;
	}
}

void TEST::processEventInWorkingState(int eventId, std::string eventContent) {
	cout << "  [State: WORKING] Processing event" << endl;
	bool processableEvent = false;
		switch(eventId){
		case TEST_EVENT_WORK:
			// NOT PROCESSABLE
			break;
		case TEST_EVENT_DONE:
			processableEvent = true;
			break;
		case TEST_EVENT_NOP:
			// NOT PROCESSABLE
			break;
		}

	if(!processableEvent){
		cout << "    Cannot process event in this state" << endl;
	} else {
		if(eventId == TEST_EVENT_DONE) {
			current_state = TEST_STATE_INIT;
			cout << "    State changed to INIT" << endl;
		}
	}

	return;
}



void TEST::generateEvent(int eventId, std::string eventContent) {
	cout << "  [Generate] Event " << eventId << " generated with content: " << eventContent << endl;
}
