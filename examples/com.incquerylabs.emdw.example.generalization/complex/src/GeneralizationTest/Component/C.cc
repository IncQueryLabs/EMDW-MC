#include "GeneralizationTest/Component/C.hh"
#include "GeneralizationTest/Component/Component_def.hh"

::std::list< ::GeneralizationTest::Component::C* > (::GeneralizationTest::Component::C::_instances);

// Constructors
::GeneralizationTest::Component::C::C(): current_state(C_STATE_a) {
	_instances.push_back(this);
	bool result = true;
}

// Destructor
::GeneralizationTest::Component::C::~C() {
	_instances.remove(this);
}

void ::GeneralizationTest::Component::C::perform_initialization() {
	::std::cout << "[C] Initialization" << ::std::endl;
	// execute actions
}

// Operation definitions
void (::GeneralizationTest::Component::C::c_operation)() {
	::std::cout << "c_operation";
}

void ::GeneralizationTest::Component::C::generate_event(const ::Event* e) {
	if(e->_isInternal) {
		_internalEvents.push(e);
	} else {
		_externalEvents.push(e);
	}
	if(_internalEvents.size() + _externalEvents.size() == 1) {
		_comp->schedule(this);
	}
}

void ::GeneralizationTest::Component::C::process() {
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

void ::GeneralizationTest::Component::C::process_event(const ::Event* event) {
	::std::cout << "[C] Event " << event->_id << " received." << ::std::endl;

	switch(current_state){
	case C_STATE_a:
		process_event_in_a_state(event);
		break;
	}
	delete event;
}

// a state
void ::GeneralizationTest::Component::C::process_event_in_a_state(const ::Event* event){
	::std::cout << "  [State: a] Processing event" << ::std::endl;
	
	{
		// event not processed in state
		::std::cout << "    [UNPROCESSED] Event cannot be processed in this state" << ::std::endl;
	}
	return;
}




