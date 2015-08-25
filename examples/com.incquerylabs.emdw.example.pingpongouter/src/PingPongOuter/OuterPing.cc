#include "PingPongOuter/OuterPing.hh"
#include "Runtime/ActiveComponent.hh"

::std::list< ::PingPongOuter::OuterPing* > (::PingPongOuter::OuterPing::_instances);

// Constructors
::PingPongOuter::OuterPing::OuterPing(): current_state(OuterPing_STATE_s1) {
	_instances.push_back(this);
	bool result = true;
}

// Destructor
::PingPongOuter::OuterPing::~OuterPing() {
	_instances.remove(this);
}

void ::PingPongOuter::OuterPing::perform_initialization() {
	::std::cout << "[OuterPing] Initialization" << ::std::endl;
	// execute actions
}


void ::PingPongOuter::OuterPing::generate_event(const ::Event* e) {
	if(e->_isInternal) {
		_internalEvents.push(e);
	} else {
		_externalEvents.push(e);
	}
	if(_internalEvents.size() + _externalEvents.size() == 1) {
		_comp->schedule(this);
	}
}

void ::PingPongOuter::OuterPing::process() {
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

void ::PingPongOuter::OuterPing::process_event(const ::Event* event) {
	::std::cout << "[OuterPing] Event " << event->_id << " received." << ::std::endl;

	switch(current_state){
	case OuterPing_STATE_s1:
		process_event_in_s1_state(event);
		break;
	case OuterPing_STATE_s2:
		process_event_in_s2_state(event);
		break;
	}
	delete event;
}

// s1 state
void ::PingPongOuter::OuterPing::process_event_in_s1_state(const ::Event* event){
	::std::cout << "  [State: s1] Processing event" << ::std::endl;
	
	// s1 -e1-> s2 transition
	if(event->_id == ::PingPongOuter::OuterPing::OuterPing_EVENT_pong_s) {
		// no exit action
		
		// no transition action
		
		// entry action
		perform_entry_action_for_s2_state(event);
		
		// state change
		current_state = OuterPing_STATE_s2;
		::std::cout << "    State changed to s2" << ::std::endl;
	}
else	{
		// event not processed in state
		::std::cout << "    [UNPROCESSED] Event cannot be processed in this state" << ::std::endl;
	}
	return;
}

void ::PingPongOuter::OuterPing::perform_entry_action_for_s1_state(const ::Event* event){
	const ::PingPongOuter::OuterPing::pong_s_event* casted_const_event = static_cast<const ::PingPongOuter::OuterPing::pong_s_event*>(event);
	::std::cout << "    [Entry: INIT]" << ::std::endl;
}

// s2 state
void ::PingPongOuter::OuterPing::process_event_in_s2_state(const ::Event* event){
	::std::cout << "  [State: s2] Processing event" << ::std::endl;
	
	// s2 -e2-> s1 transition
	if(event->_id == ::PingPongOuter::OuterPing::OuterPing_EVENT_pong_s) {
		// no exit action
		
		// no transition action
		
		// entry action
		perform_entry_action_for_s1_state(event);
		
		// state change
		current_state = OuterPing_STATE_s1;
		::std::cout << "    State changed to s1" << ::std::endl;
	}
else	{
		// event not processed in state
		::std::cout << "    [UNPROCESSED] Event cannot be processed in this state" << ::std::endl;
	}
	return;
}

void ::PingPongOuter::OuterPing::perform_entry_action_for_s2_state(const ::Event* event){
	const ::PingPongOuter::OuterPing::pong_s_event* casted_const_event = static_cast<const ::PingPongOuter::OuterPing::pong_s_event*>(event);
	::std::cout << "    [Entry: INIT]" << ::std::endl;
}


::PingPongOuter::OuterPing::pong_s_event::pong_s_event(bool isInternal) :
::Event(OuterPing_EVENT_pong_s, isInternal){
}

