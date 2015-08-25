#include "Pong.hh"
#include "Comp_def.hh"

::std::list< ::model::Comp::Pong*> (::model::Comp::Pong::_instances);

// Constructors
::model::Comp::Pong::Pong(): current_state(Pong_STATE_s1) {
	_instances.push_back(this);
}

// Destructor
::model::Comp::Pong::~Pong() {
	_instances.remove(this);
}

void ::model::Comp::Pong::perform_initialization() {
	::std::cout << "[Pong] Initialization" << ::std::endl;
	// execute actions
}

void ::model::Comp::Pong::generate_event(const ::Event* e) {
	if(e->_isInternal) {
		_internalEvents.push(e);
	} else {
		_externalEvents.push(e);
	}
	if(_internalEvents.size() + _externalEvents.size() == 1) {
		_comp->schedule(this);
	}
}

void ::model::Comp::Pong::process() {
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


void ::model::Comp::Pong::process_event(const ::Event* event) {
	::std::cout << "[Pong] Event " << event->_id << " received." << ::std::endl;

	switch(current_state){
	case Pong_STATE_s1:
		process_event_in_s1_state(event);
		break;
	case Pong_STATE_s2:
		process_event_in_s2_state(event);
		break;
	}
}

// s1 state

void ::model::Comp::Pong::process_event_in_s1_state(const ::Event* event){
	::std::cout << "  [State: s1] Processing event" << ::std::endl;
	// s1 -e1-> s2 transition
	if(event->_id == Pong_EVENT_ping_s) {
		// no exit action
		
		// no transition action
		
		// entry action
		perform_entry_action_for_s2_state(event);
		
		// state change
		current_state = Pong_STATE_s2;
		::std::cout << "    State changed to s2" << ::std::endl;
	} else 
	{
		// event not processed in state
		::std::cout << "    [UNPROCESSED] Event cannot be processed in this state" << ::std::endl;
	}
	return;
}

// s2 state
void ::model::Comp::Pong::perform_entry_action_for_s2_state(const ::Event* event){
	::std::cout << "    [Entry: INIT]" << ::std::endl;
	R1_ping->generate_event(new Ping::pong_s_event(false));
}

void ::model::Comp::Pong::process_event_in_s2_state(const ::Event* event){
	::std::cout << "  [State: s2] Processing event" << ::std::endl;
	// s2 -e2-> s1 transition
	if(event->_id == Pong_EVENT_ping_s) {
		// no exit action
		
		// transition action
		perform_actions_on_e2_transition_from_s2_to_s1(event);
		
		// no entry action
		
		// state change
		current_state = Pong_STATE_s1;
		::std::cout << "    State changed to s1" << ::std::endl;
	} else 
	{
		// event not processed in state
		::std::cout << "    [UNPROCESSED] Event cannot be processed in this state" << ::std::endl;
	}
	return;
}

void ::model::Comp::Pong::perform_actions_on_e2_transition_from_s2_to_s1(const ::Event* event){
	::std::cout << "    [Action: -> s1]" << ::std::endl;
	R1_ping->generate_event(new Ping::pong_s_event(false));
}

::model::Comp::Pong::ping_s_event::ping_s_event(bool isInternal) : 
	::Event(Pong_EVENT_ping_s, isInternal){
}

