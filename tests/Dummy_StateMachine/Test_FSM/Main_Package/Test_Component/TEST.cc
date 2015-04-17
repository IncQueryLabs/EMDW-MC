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
		processEventInProcessingState(eventId, eventContent);
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
		processableEvent = true;
		break;
	case TEST_EVENT_NOP:
		// NOT PROCESSABLE
		break;
	}

	if(!processableEvent){
		cout << "  Cannot process event in this state" << endl;
	} else {

	}

	return;
}

void TEST::processEventInProcessingState(int eventId, std::string eventContent) {
	cout << "  [State: PROCESSING] Processing event" << endl;
	bool processableEvent = false;
		switch(eventId){
		case TEST_EVENT_WORK:
			// NOT PROCESSABLE
			break;
		case TEST_EVENT_DONE:
			// NOT PROCESSABLE
			break;
		case TEST_EVENT_NOP:
			processableEvent = true;
			break;
		}

	if(!processableEvent){
		cout << "  Cannot process event in this state" << endl;
	} else {
	}

	return;
}
