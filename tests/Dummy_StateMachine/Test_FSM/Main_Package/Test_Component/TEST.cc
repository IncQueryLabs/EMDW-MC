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

// GENERATED CODE START

// Constructor
::Test_FSM::Main_Package::Test_Component::Test_Package::TEST::TEST(): current_state(TEST_STATE_INIT) {
}

// Destructor
::Test_FSM::Main_Package::Test_Component::Test_Package::TEST::~TEST() {
}

void ::Test_FSM::Main_Package::Test_Component::Test_Package::TEST::processEvent(int eventId, std::string eventContent) {
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

void ::Test_FSM::Main_Package::Test_Component::Test_Package::TEST::performEntryActionForInitState(int eventId, std::string eventContent) {
	cout << "    [Entry: INIT]" << endl;
}

void ::Test_FSM::Main_Package::Test_Component::Test_Package::TEST::processEventInInitState(int eventId, std::string eventContent) {
	cout << "  [State: INIT] Processing event" << endl;

	// Init -WORK-> Work transition
	if(eventId == TEST_EVENT_WORK && evaluateGuardOnInitToWorkingTransition(eventId, eventContent)){
		// exit
		performExitActionForWorkingState(eventId, eventContent);
		// no action
		// entry
		performEntryActionForInitState(eventId, eventContent);
		// state change
		current_state = TEST_STATE_WORKING;
		cout << "    State changed to WORKING" << endl;
	} else
	// Init -NOP-> Init transition
	if(eventId == TEST_EVENT_NOP) {
		// exit
		performExitActionForInitState(eventId, eventContent);
		// action
		performActionsOnInitToInitTransition(eventId, eventContent);
		// entry
		performEntryActionForInitState(eventId, eventContent);
		cout << "    No state change on NOP" << endl;
	} else {
		cout << "    Cannot process event in this state" << endl;
	}

	return;
}

bool ::Test_FSM::Main_Package::Test_Component::Test_Package::TEST::evaluateGuardOnInitToWorkingTransition(int eventId, std::string eventContent) {
	if(eventContent == "valid") {
		return true;
	} else {
		cout << "    [-> WORKING] Invalid content, guard false" << endl;
		return false;
	}
}

void ::Test_FSM::Main_Package::Test_Component::Test_Package::TEST::performActionsOnInitToInitTransition(int eventId, std::string eventContent) {
	cout << "    [Action]" << endl;
}

void ::Test_FSM::Main_Package::Test_Component::Test_Package::TEST::performExitActionForInitState(int eventId, std::string eventContent) {
	cout << "    [Exit]" << endl;
}

void ::Test_FSM::Main_Package::Test_Component::Test_Package::TEST::performEntryActionForWorkingState(int eventId, std::string eventContent) {
	cout << "    [Entry: WORKING]" << endl;
}

void ::Test_FSM::Main_Package::Test_Component::Test_Package::TEST::processEventInWorkingState(int eventId, std::string eventContent) {
	cout << "  [State: WORKING] Processing event" << endl;

	// Working -DONE-> Init transition
	if(eventId == TEST_EVENT_DONE) {
		// exit
		performExitActionForWorkingState(eventId, eventContent);
		// no action
		// entry
		performEntryActionForInitState(eventId, eventContent);
		// state change
		current_state = TEST_STATE_INIT;
		cout << "    State changed to INIT" << endl;
	} else
	// Working -NOP-> Working self-trasition
	if(eventId == TEST_EVENT_NOP) {
		// no exit
		// action
		performActionsOnWorkingToWorkingTransition(eventId, eventContent);
		// no entry
	} else {
		cout << "    Cannot process event in this state" << endl;
	}

	return;
}

void ::Test_FSM::Main_Package::Test_Component::Test_Package::TEST::performActionsOnWorkingToWorkingTransition(int eventId, std::string eventContent) {
	cout << "    [Action]" << endl;
}

void ::Test_FSM::Main_Package::Test_Component::Test_Package::TEST::performExitActionForWorkingState(int eventId, std::string eventContent) {
	cout << "    [Exit]" << endl;
}

void ::Test_FSM::Main_Package::Test_Component::Test_Package::TEST::generateEvent(int eventId, std::string eventContent) {
	cout << "    [Generate] Event " << eventId << " generated with content: " << eventContent << endl;
}

// GENERATED CODE END
