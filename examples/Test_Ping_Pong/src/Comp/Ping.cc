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
#include "Ping.hh"
#include "Comp_def.hh"

::std::list< ::model::Comp::Ping*> (::model::Comp::Ping::_instances);

// Constructors
::model::Comp::Ping::Ping(): current_state(Ping_STATE_s1) {
	_instances.push_back(this);
}

// Destructor
::model::Comp::Ping::~Ping() {
	_instances.remove(this);
}

void ::model::Comp::Ping::perform_initialization() {
	::std::cout << "[Ping] Initialization" << ::std::endl;
	// execute actions
	R1_pong->generate_event(new Pong::ping_s_event(false));
}

void ::model::Comp::Ping::generate_event(const ::Event* e) {
	if(e->_isInternal) {
		_internalEvents.push(e);
	} else {
		_externalEvents.push(e);
	}
	if(_internalEvents.size() + _externalEvents.size() == 1) {
		_comp->schedule(this);
	}
}

void ::model::Comp::Ping::process() {
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


void ::model::Comp::Ping::process_event(const ::Event* event) {
	::std::cout << "[Ping] Event " << event->_id << " received." << ::std::endl;

	switch(current_state){
	case Ping_STATE_s1:
		process_event_in_s1_state(event);
		break;
	case Ping_STATE_s2:
		process_event_in_s2_state(event);
		break;
	}
}

// s1 state
void ::model::Comp::Ping::perform_entry_action_for_s1_state(const ::Event* event){
	::std::cout << "    [Entry: INIT]" << ::std::endl;
	R1_pong->generate_event(new Pong::ping_s_event(false));
}

void ::model::Comp::Ping::process_event_in_s1_state(const ::Event* event){
	::std::cout << "  [State: s1] Processing event" << ::std::endl;
	// s1 -e1-> s2 transition
	if(event->_id == Ping_EVENT_pong_s) {
		// no exit action
		
		// no transition action
		
		// entry action
		perform_entry_action_for_s2_state(event);
		
		// state change
		current_state = Ping_STATE_s2;
		::std::cout << "    State changed to s2" << ::std::endl;
	} else 
	{
		// event not processed in state
		::std::cout << "    [UNPROCESSED] Event cannot be processed in this state" << ::std::endl;
	}
	return;
}

// s2 state
void ::model::Comp::Ping::perform_entry_action_for_s2_state(const ::Event* event){
	::std::cout << "    [Entry: INIT]" << ::std::endl;
	R1_pong->generate_event(new Pong::ping_s_event(false));
}

void ::model::Comp::Ping::process_event_in_s2_state(const ::Event* event){
	::std::cout << "  [State: s2] Processing event" << ::std::endl;
	// s2 -e2-> s1 transition
	if(event->_id == Ping_EVENT_pong_s) {
		// no exit action
		
		// no transition action
		
		// entry action
		perform_entry_action_for_s1_state(event);
		
		// state change
		current_state = Ping_STATE_s1;
		::std::cout << "    State changed to s1" << ::std::endl;
	} else 
	{
		// event not processed in state
		::std::cout << "    [UNPROCESSED] Event cannot be processed in this state" << ::std::endl;
	}
	return;
}


::model::Comp::Ping::pong_s_event::pong_s_event(bool isInternal) : 
	::Event(Ping_EVENT_pong_s, isInternal){
}

