#ifndef __PINGPONGOUTER__COMPONENT__PONG_HEADER
#define __PINGPONGOUTER__COMPONENT__PONG_HEADER

#include "PingPongOuter/Component/Component_decl.hh"
#include "Runtime/StatefulClass.hh"
#include "Runtime/Event.hh"
#include "Runtime/unique_number.hh"
#include "Runtime/type_number.hh"
#include <list>
#include <queue>
#include <iostream>

namespace PingPongOuter{
namespace Component{

class Pong: public ::StatefulClass {

public:

	
	// Constructors
	Pong();
	
	// Destructor
	virtual ~Pong();
	
	// Type id getters
	static ::unique_number __get_static_type_number() { return ::type_number<Pong*>::number; }
	virtual ::unique_number __get_dynamic_type_number() { return __get_static_type_number(); }
	
	// Initialization
	void perform_initialization();
	
	// Attributes
	
	// Associations
	::PingPongOuter::Component::Ping* R1_ping;
	
	// Component reference
	::PingPongOuter::Component::Component* _comp;
	
	// Operation declarations
	
	// Event enum class
	class Pong_event {
	public:
		enum __val_type {
			ping_s
		};
		Pong_event(): __val(ping_s) {}
		Pong_event(__val_type v): __val(v) {}
		operator __val_type() const { return __val; }
	private:
		__val_type __val;
	};
	
	class ping_s_event : public ::Event {
		public:
			// Constructor
			ping_s_event(bool isInternal);
			// Attributes
	};
	
	
	class Pong_state {
	public:
		enum __val_type {
			s1,
			s2
		};
		Pong_state(): __val(s1) {}
		Pong_state(__val_type v): __val(v) {}
		operator __val_type() const { return __val; }
	private:
		__val_type __val;
	};
	
	
	Pong_state current_state;
	
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
	Pong(const Pong&);
	
	// Deny copy of the class using assignment
	Pong& operator=(const Pong&);
	
	static ::std::list< ::PingPongOuter::Component::Pong* > _instances;
	
	// Constructors
	
	// Destructor
	
	// Attributes
	
	// Operation declarations
	
	// s1 state
	
	void process_event_in_s1_state(const ::Event* event);
	
	// s2 state
	void perform_entry_action_for_s2_state(const ::Event* event);
	
	void process_event_in_s2_state(const ::Event* event);
	
	void perform_actions_on_e2_transition_from_s2_to_s1(const ::Event* event);
	// State queues
	::std::queue<const ::Event*> _internalEvents, _externalEvents;
}; /* class Pong */
} /* namespace Component */
} /* namespace PingPongOuter */

#endif /* __PINGPONGOUTER__COMPONENT__PONG_HEADER */
