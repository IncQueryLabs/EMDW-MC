#include "GeneralizationTest/Component/F.hh"
#include "GeneralizationTest/Component/Component_def.hh"

::std::list< ::GeneralizationTest::Component::F* > (::GeneralizationTest::Component::F::_instances);

// Constructors
::GeneralizationTest::Component::F::F(): current_state(F_STATE_f), ::GeneralizationTest::Component::D() {
	_instances.push_back(this);
	bool result = true;
}

// Destructor
::GeneralizationTest::Component::F::~F() {
	_instances.remove(this);
}

void ::GeneralizationTest::Component::F::perform_initialization() {
	::std::cout << "[F] Initialization" << ::std::endl;
	// execute actions
}

// Operation definitions
void (::GeneralizationTest::Component::F::c_operation)(bool bool_param) {
	::std::cout << "c_operation with bool_param: " << bool_param;
}

void ::GeneralizationTest::Component::F::generate_event(const ::Event* e) {
	if(e->_isInternal) {
		_internalEvents.push(e);
	} else {
		_externalEvents.push(e);
	}
	if(_internalEvents.size() + _externalEvents.size() == 1) {
		_comp->schedule(this);
	}
}

void ::GeneralizationTest::Component::F::process() {
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

void ::GeneralizationTest::Component::F::process_event(const ::Event* event) {
	::std::cout << "[F] Event " << event->_id << " received." << ::std::endl;

	switch(current_state){
	case F_STATE_f:
		process_event_in_f_state(event);
		break;
	}
	delete event;
}

// f state
void ::GeneralizationTest::Component::F::process_event_in_f_state(const ::Event* event){
	::std::cout << "  [State: f] Processing event" << ::std::endl;
	
	{
		// event not processed in state
		::std::cout << "    [UNPROCESSED] Event cannot be processed in this state" << ::std::endl;
	}
	return;
}




