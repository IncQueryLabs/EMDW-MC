/*******************************************************************************
 * Copyright (c) 2015-2016 IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
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

#include "Test_FSM/Test_Component/Test_Component_def.hh"

// GENERATED CODE START

::std::list< ::Test_FSM::Test_Component::Test_Package::TEST*> (::Test_FSM::Test_Component::Test_Package::TEST::_instances);

// Constructors
::Test_FSM::Test_Component::Test_Package::TEST::TEST(): current_state(TEST_STATE_myState1) {
	_instances.push_back(this);
}

// Destructor
::Test_FSM::Test_Component::Test_Package::TEST::~TEST() {
	_instances.remove(this);
}

void ::Test_FSM::Test_Component::Test_Package::TEST::perform_initialization() {
	::std::cout << "[TEST] Initialization" << endl;
	// execute actions
	std::cout << "myTransitionI1 happened" << std::endl;
	std::cout << "This is the entry action for myState1" << std::endl;
}

void ::Test_FSM::Test_Component::Test_Package::TEST::generate_event(const ::Event* e) {
	if(e->_isInternal) {
		_internalEvents.push(e);
	} else {
		_externalEvents.push(e);
	}
	if(_internalEvents.size() + _externalEvents.size() == 1) {
		_comp->schedule(this);
	}
}

void ::Test_FSM::Test_Component::Test_Package::TEST::process() {
	const ::Event* evt;
	if(!_internalEvents.empty()) {
		evt = _internalEvents.front();
		_internalEvents.pop();
	} else {
		evt = _externalEvents.front();
		_externalEvents.pop();
	}
	if(!_internalEvents.empty() or !_externalEvents.empty()) {
		_comp->schedule(this);
	}
	process_event(evt);
}


void ::Test_FSM::Test_Component::Test_Package::TEST::process_event(const ::Event* event) {
	::std::cout << "[TEST] Event " << event->_id << " received." << endl;

	switch(current_state){
	case TEST_STATE_myState1:
		process_event_in_myState1_state(event);
		break;
	case TEST_STATE_myState2:
		process_event_in_myState2_state(event);
		break;
	case TEST_STATE_myState3:
		process_event_in_myState3_state(event);
		break;
	case TEST_STATE_myState4:
		process_event_in_myState4_state(event);
		break;
	case TEST_STATE_myState5:
		process_event_in_myState5_state(event);
		break;
	}
	if(current_state == TEST_STATE_TERMINATE){
		delete this;
	}
}

// myState1 state
void ::Test_FSM::Test_Component::Test_Package::TEST::perform_entry_action_for_myState1_state(const ::Event* event){
	::std::cout << "    [Entry: INIT]" << endl;
	std::cout << "This is the entry action for myState1" << std::endl;
}

void ::Test_FSM::Test_Component::Test_Package::TEST::process_event_in_myState1_state(const ::Event* event){
	::std::cout << "  [State: myState1] Processing event" << endl;
	// myState1 -myT12-> myState2 transition
	if(event->_id == TEST_EVENT_mySignal1) {
		// no exit action

		// no transition action

		// entry action
		perform_entry_action_for_myState2_state(event);

		// state change
		current_state = TEST_STATE_myState2;
		::std::cout << "    State changed to myState2" << endl;
	} else
	// myState1 -myT13-> myState3 transition
	if(event->_id == TEST_EVENT_mySignal2) {
		// no exit action

		// transition action
		perform_actions_on_myT13_transition_from_myState1_to_myState3(event);

		// no entry action

		// state change
		current_state = TEST_STATE_myState3;
		::std::cout << "    State changed to myState3" << endl;
	} else
	{
		// event not processed in state
		::std::cout << "    [UNPROCESSED] Event cannot be processed in this state" << endl;
	}
	return;
}

void ::Test_FSM::Test_Component::Test_Package::TEST::perform_actions_on_myT13_transition_from_myState1_to_myState3(const ::Event* event){
	::std::cout << "    [Action: -> myState3]" << endl;
	std::cout << "myTransition13 happened" << std::endl;
}
// myState2 state
void ::Test_FSM::Test_Component::Test_Package::TEST::perform_entry_action_for_myState2_state(const ::Event* event){
	::std::cout << "    [Entry: INIT]" << endl;
	std::cout << "This is the entry action for myState2" << std::endl;
}

void ::Test_FSM::Test_Component::Test_Package::TEST::process_event_in_myState2_state(const ::Event* event){
	::std::cout << "  [State: myState2] Processing event" << endl;
	// myState2 -myT24-> myState4 transition
	if(event->_id == TEST_EVENT_mySignal3) {
		// exit action
		perform_exit_action_for_myState2_state(event);

		// transition action
		perform_actions_on_myT24_transition_from_myState2_to_myState4(event);

		// no entry action

		// state change
		current_state = TEST_STATE_myState4;
		::std::cout << "    State changed to myState4" << endl;
	} else
	{
		// event not processed in state
		::std::cout << "    [UNPROCESSED] Event cannot be processed in this state" << endl;
	}
	return;
}

void ::Test_FSM::Test_Component::Test_Package::TEST::perform_actions_on_myT24_transition_from_myState2_to_myState4(const ::Event* event){
	::std::cout << "    [Action: -> myState4]" << endl;
	std::cout << "myTransition24 happened" << std::endl;
}
void ::Test_FSM::Test_Component::Test_Package::TEST::perform_exit_action_for_myState2_state(const ::Event* event){
	::std::cout << "    [Exit]" << endl;
	std::cout << "This is the exit action for myState2" << std::endl;
}
// myState3 state

void ::Test_FSM::Test_Component::Test_Package::TEST::process_event_in_myState3_state(const ::Event* event){
	::std::cout << "  [State: myState3] Processing event" << endl;
	// myState3 -myT35-> myState5 transition
	if(event->_id == TEST_EVENT_mySignal3) {
		// exit action
		perform_exit_action_for_myState3_state(event);

		// transition action
		perform_actions_on_myT35_transition_from_myState3_to_myState5(event);

		// entry action
		perform_entry_action_for_myState5_state(event);

		// state change
		current_state = TEST_STATE_myState5;
		::std::cout << "    State changed to myState5" << endl;
	} else
	// myState3 -myT34-> myState4 transition
	if(event->_id == TEST_EVENT_mySignal1 && evaluate_guard_on_myT34_transition_from_myState3_to_myState4(event)) {
		// exit action
		perform_exit_action_for_myState3_state(event);

		// no transition action

		// no entry action

		// state change
		current_state = TEST_STATE_myState4;
		::std::cout << "    State changed to myState4" << endl;
	} else
	// myState3 -myT33-> myState3 transition
	if(event->_id == TEST_EVENT_mySignal1) {
		// exit action
		perform_exit_action_for_myState3_state(event);

		// no transition action

		// no entry action

		// no state change
		::std::cout << "    No state change on myT33" << endl;
	} else
	{
		// event not processed in state
		::std::cout << "    [UNPROCESSED] Event cannot be processed in this state" << endl;
	}
	return;
}

void ::Test_FSM::Test_Component::Test_Package::TEST::perform_actions_on_myT35_transition_from_myState3_to_myState5(const ::Event* event){
	::std::cout << "    [Action: -> myState5]" << endl;
	std::cout << "myTransition35 happened" << std::endl;
}
bool ::Test_FSM::Test_Component::Test_Package::TEST::evaluate_guard_on_myT34_transition_from_myState3_to_myState4(const ::Event* event){
	::std::cout << "    [Guard: -> myState4]" << endl;

	if(myInt<42) {
		return true;
	} else {
		::std::cout << "    Guard false" << endl;
		return false;
	}
}
void ::Test_FSM::Test_Component::Test_Package::TEST::perform_exit_action_for_myState3_state(const ::Event* event){
	::std::cout << "    [Exit]" << endl;
	std::cout << "This is the exit action for myState3" << std::endl;
}
// myState4 state

void ::Test_FSM::Test_Component::Test_Package::TEST::process_event_in_myState4_state(const ::Event* event){
	::std::cout << "  [State: myState4] Processing event" << endl;
	// myState4 -myT4F-> TERMINATE transition
	if(event->_id == TEST_EVENT_mySignal1) {
		// no exit action

		// no transition action


		// state change
		current_state = TEST_STATE_TERMINATE;
		::std::cout << "    State changed to TERMINATE" << endl;
	} else
	{
		// event not processed in state
		::std::cout << "    [UNPROCESSED] Event cannot be processed in this state" << endl;
	}
	return;
}

// myState5 state
void ::Test_FSM::Test_Component::Test_Package::TEST::perform_entry_action_for_myState5_state(const ::Event* event){
	::std::cout << "    [Entry: INIT]" << endl;
	std::cout << "This is the entry action for myState5" << std::endl;
}

void ::Test_FSM::Test_Component::Test_Package::TEST::process_event_in_myState5_state(const ::Event* event){
	::std::cout << "  [State: myState5] Processing event" << endl;
	// myState5 -myT5F-> TERMINATE transition
	if(event->_id == TEST_EVENT_mySignal2) {
		// no exit action

		// transition action
		perform_actions_on_myT5F_transition_from_myState5_to_TERMINATE(event);


		// state change
		current_state = TEST_STATE_TERMINATE;
		::std::cout << "    State changed to TERMINATE" << endl;
	} else
	{
		// event not processed in state
		::std::cout << "    [UNPROCESSED] Event cannot be processed in this state" << endl;
	}
	return;
}

void ::Test_FSM::Test_Component::Test_Package::TEST::perform_actions_on_myT5F_transition_from_myState5_to_TERMINATE(const ::Event* event){
	::std::cout << "    [Action: -> TERMINATE]" << endl;
	std::cout << "myTransition5F happened" << std::endl;
}

::Test_FSM::Test_Component::Test_Package::TEST::mySignal1_event::mySignal1_event(bool isInternal) :
	::Event(TEST_EVENT_mySignal1, isInternal){
}
::Test_FSM::Test_Component::Test_Package::TEST::mySignal2_event::mySignal2_event(bool isInternal) :
	::Event(TEST_EVENT_mySignal2, isInternal){
}
::Test_FSM::Test_Component::Test_Package::TEST::mySignal3_event::mySignal3_event(bool isInternal) :
	::Event(TEST_EVENT_mySignal3, isInternal){
}

// GENERATED CODE END
