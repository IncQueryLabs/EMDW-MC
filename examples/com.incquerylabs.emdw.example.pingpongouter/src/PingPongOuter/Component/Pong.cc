#include "PingPongOuter/Component/Pong.hh"
#include "PingPongOuter/Component/Component_def.hh"

::std::list< ::PingPongOuter::Component::Pong* > (::PingPongOuter::Component::Pong::_instances);

// Constructors
::PingPongOuter::Component::Pong::Pong(): current_state(::PingPongOuter::Component::Pong::Pong_state::s1) {
	::std::cout << "[Pong] constructor call: ::PingPongOuter::Component::Pong::Pong()" << ::std::endl;
	_instances.push_back(this);
	bool result = true;
}

// Destructor
::PingPongOuter::Component::Pong::~Pong() {
	::std::cout << "[Pong] destructor call: ::PingPongOuter::Component::Pong::~Pong()" << ::std::endl;
	_instances.remove(this);
}

void ::PingPongOuter::Component::Pong::perform_initialization() {
	::std::cout << "[Pong] Initialization" << ::std::endl;
	// execute actions
}


void ::PingPongOuter::Component::Pong::generate_event(const ::Event* e) {
	if(e->_isInternal) {
		_internalEvents.push(e);
	} else {
		_externalEvents.push(e);
	}
	if(_internalEvents.size() + _externalEvents.size() == 1) {
		_comp->schedule(this);
	}
}

void ::PingPongOuter::Component::Pong::process() {
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

void ::PingPongOuter::Component::Pong::process_event(const ::Event* event) {
	::std::cout << "[Pong] Event " << event->_id << " received." << ::std::endl;

	switch(current_state){
	case ::PingPongOuter::Component::Pong::Pong_state::s1:
		process_event_in_s1_state(event);
		break;
	case ::PingPongOuter::Component::Pong::Pong_state::s2:
		process_event_in_s2_state(event);
		break;
	}
	delete event;
}

// s1 state
void ::PingPongOuter::Component::Pong::process_event_in_s1_state(const ::Event* event){
	::std::cout << "  [State: s1] Processing event" << ::std::endl;
	
	// s1 -e1-> s2 transition
	if(event->_id == ::PingPongOuter::Component::Pong::Pong_event::ping_s) {
		// no exit action
		
		// no transition action
		
		// entry action
		perform_entry_action_for_s2_state(event);
		
		// state change
		current_state = ::PingPongOuter::Component::Pong::Pong_state::s2;
		::std::cout << "    State changed to s2" << ::std::endl;
	}
else	{
		// event not processed in state
		::std::cout << "    [UNPROCESSED] Event cannot be processed in this state" << ::std::endl;
	}
	return;
}


// s2 state
void ::PingPongOuter::Component::Pong::process_event_in_s2_state(const ::Event* event){
	::std::cout << "  [State: s2] Processing event" << ::std::endl;
	
	// s2 -e2-> s1 transition
	if(event->_id == ::PingPongOuter::Component::Pong::Pong_event::ping_s) {
		// no exit action
		
		// transition action
		perform_actions_on_e2_transition_from_s2_to_s1(event);
		
		// no entry action
		
		// state change
		current_state = ::PingPongOuter::Component::Pong::Pong_state::s1;
		::std::cout << "    State changed to s1" << ::std::endl;
	}
else	{
		// event not processed in state
		::std::cout << "    [UNPROCESSED] Event cannot be processed in this state" << ::std::endl;
	}
	return;
}

void ::PingPongOuter::Component::Pong::perform_entry_action_for_s2_state(const ::Event* event){
	const ::PingPongOuter::Component::Pong::ping_s_event* casted_const_event = static_cast<const ::PingPongOuter::Component::Pong::ping_s_event*>(event);
	::std::cout << "    [Entry: INIT]" << ::std::endl;
	R1_ping->generate_event(new Ping::pong_s_event(false));
}

void ::PingPongOuter::Component::Pong::perform_actions_on_e2_transition_from_s2_to_s1(const ::Event* event){
	const ::PingPongOuter::Component::Pong::ping_s_event* casted_const_event = static_cast<const ::PingPongOuter::Component::Pong::ping_s_event*>(event);
	::std::cout << "    [Action: -> s1]" << ::std::endl;
	R1_ping->generate_event(new Ping::pong_s_event(false));
}

::PingPongOuter::Component::Pong::ping_s_event::ping_s_event(bool isInternal) : 
::Event(::PingPongOuter::Component::Pong::Pong_event::ping_s, isInternal){
}

