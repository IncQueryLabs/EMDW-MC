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
#include "PingPongOuter/Component/Ping.hh"
#include "PingPongOuter/Component/Component_def.hh"

::std::list< ::PingPongOuter::Component::Ping* > (::PingPongOuter::Component::Ping::_instances);

// Constructors
::PingPongOuter::Component::Ping::Ping(): current_state(::PingPongOuter::Component::Ping::Ping_state::s1) {
	::std::cout << "[Ping] constructor call: ::PingPongOuter::Component::Ping::Ping()" << ::std::endl;
	_instances.push_back(this);
	bool result = true;
}

// Destructor
::PingPongOuter::Component::Ping::~Ping() {
	::std::cout << "[Ping] destructor call: ::PingPongOuter::Component::Ping::~Ping()" << ::std::endl;
	_instances.remove(this);
}

void ::PingPongOuter::Component::Ping::perform_initialization() {
	::std::cout << "[Ping] Initialization" << ::std::endl;
	// execute actions
	R1_pong->generate_event(new Pong::ping_s_event(false));
}


void ::PingPongOuter::Component::Ping::generate_event(const ::Event* e) {
	if(e->_isInternal) {
		_internalEvents.push(e);
	} else {
		_externalEvents.push(e);
	}
	if(_internalEvents.size() + _externalEvents.size() == 1) {
		_comp->schedule(this);
	}
}

void ::PingPongOuter::Component::Ping::process() {
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

void ::PingPongOuter::Component::Ping::process_event(const ::Event* event) {
	::std::cout << "[Ping] Event " << event->_id << " received." << ::std::endl;

	switch(current_state){
	case ::PingPongOuter::Component::Ping::Ping_state::s1:
		process_event_in_s1_state(event);
		break;
	case ::PingPongOuter::Component::Ping::Ping_state::s2:
		process_event_in_s2_state(event);
		break;
	}
	delete event;
}

// s1 state
void ::PingPongOuter::Component::Ping::process_event_in_s1_state(const ::Event* event){
	::std::cout << "  [State: s1] Processing event" << ::std::endl;
	
	// s1 -e1-> s2 transition
	if(event->_id == ::PingPongOuter::Component::Ping::Ping_event::pong_s) {
		// no exit action
		
		// no transition action
		
		// entry action
		perform_entry_action_for_s2_state(event);
		
		// state change
		current_state = ::PingPongOuter::Component::Ping::Ping_state::s2;
		::std::cout << "    State changed to s2" << ::std::endl;
	}
else	{
		// event not processed in state
		::std::cout << "    [UNPROCESSED] Event cannot be processed in this state" << ::std::endl;
	}
	return;
}

void ::PingPongOuter::Component::Ping::perform_entry_action_for_s1_state(const ::Event* event){
	const ::PingPongOuter::Component::Ping::pong_s_event* casted_const_event = static_cast<const ::PingPongOuter::Component::Ping::pong_s_event*>(event);
	::std::cout << "    [Entry: INIT]" << ::std::endl;
	R1_pong->generate_event(new Pong::ping_s_event(false));
}

// s2 state
void ::PingPongOuter::Component::Ping::process_event_in_s2_state(const ::Event* event){
	::std::cout << "  [State: s2] Processing event" << ::std::endl;
	
	// s2 -e2-> s1 transition
	if(event->_id == ::PingPongOuter::Component::Ping::Ping_event::pong_s) {
		// no exit action
		
		// no transition action
		
		// entry action
		perform_entry_action_for_s1_state(event);
		
		// state change
		current_state = ::PingPongOuter::Component::Ping::Ping_state::s1;
		::std::cout << "    State changed to s1" << ::std::endl;
	}
else	{
		// event not processed in state
		::std::cout << "    [UNPROCESSED] Event cannot be processed in this state" << ::std::endl;
	}
	return;
}

void ::PingPongOuter::Component::Ping::perform_entry_action_for_s2_state(const ::Event* event){
	const ::PingPongOuter::Component::Ping::pong_s_event* casted_const_event = static_cast<const ::PingPongOuter::Component::Ping::pong_s_event*>(event);
	::std::cout << "    [Entry: INIT]" << ::std::endl;
	R1_pong->generate_event(new Pong::ping_s_event(false));
}


::PingPongOuter::Component::Ping::pong_s_event::pong_s_event(bool isInternal) : 
::Event(::PingPongOuter::Component::Ping::Ping_event::pong_s, isInternal){
}

