#ifndef __PINGPONGOUTER__OUTERPING_HEADER
#define __PINGPONGOUTER__OUTERPING_HEADER

#include "Runtime/ActiveComponent.hh"
#include "Runtime/StatefulClass.hh"
#include "Runtime/Event.hh"
#include "Runtime/unique_number.hh"
#include "Runtime/type_number.hh"
#include <list>
#include <queue>
#include <iostream>

namespace PingPongOuter{

class OuterPing : public ::StatefulClass {

public:

	
	// Constructors
	OuterPing();
	
	// Destructor
	virtual ~OuterPing();
	
	// Type id getters
	static ::unique_number __get_static_type_number() { return ::type_number<OuterPing*>::number; }
	virtual ::unique_number __get_dynamic_type_number() { return __get_static_type_number(); }
	
	// Initialization
	void perform_initialization();
	
	// Attributes
	
	// Associations
	
	// Component reference
	::ActiveComponent* _comp;
	
	// Operation declarations
	
	enum OuterPing_state {
		OuterPing_STATE_s1,
		OuterPing_STATE_s2
	};
	
	enum OuterPing_event {
		OuterPing_EVENT_pong_s
	};
	
	class pong_s_event : public ::Event {
		public:
			// Constructor
			pong_s_event(bool isInternal);
			// Attributes
	};
	
	
	
	OuterPing_state current_state;
	
	virtual void generate_event(const ::Event* e);
	virtual void process();
	
	void process_event(const ::Event* event);

protected:

	// Constructors
	
	// Destructor
	
	// Attributes
	
	// Operation declarations

private:

	// Deny copy of the class using copy constructor
	OuterPing(const OuterPing&);
	
	// Deny copy of the class using assignment
	OuterPing& operator=(const OuterPing&);
	
	static ::std::list< ::PingPongOuter::OuterPing* > _instances;
	
	// Constructors
	
	// Destructor
	
	// Attributes
	
	// Operation declarations
	
	// s1 state
	void perform_entry_action_for_s1_state(const ::Event* event);
	
	void process_event_in_s1_state(const ::Event* event);
	
	// s2 state
	void perform_entry_action_for_s2_state(const ::Event* event);
	
	void process_event_in_s2_state(const ::Event* event);
	
	// State queues
	::std::queue<const ::Event*> _internalEvents, _externalEvents;
}; /* class OuterPing */
} /* namespace PingPongOuter */

#endif /* __PINGPONGOUTER__OUTERPING_HEADER */
