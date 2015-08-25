#ifndef __PINGPONGOUTER__COMPONENT__PING_HEADER
#define __PINGPONGOUTER__COMPONENT__PING_HEADER

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

class Ping: public ::StatefulClass {

public:

	
	// Constructors
	Ping();
	
	// Destructor
	virtual ~Ping();
	
	// Type id getters
	static ::unique_number __get_static_type_number() { return ::type_number<Ping*>::number; }
	virtual ::unique_number __get_dynamic_type_number() { return __get_static_type_number(); }
	
	// Initialization
	void perform_initialization();
	
	// Attributes
	
	// Associations
	::PingPongOuter::Component::Pong* R1_pong;
	
	// Component reference
	::PingPongOuter::Component::Component* _comp;
	
	// Operation declarations
	
	// Event enum class
	class Ping_event {
	public:
		enum __val_type {
			pong_s
		};
		Ping_event(): __val(pong_s) {}
		Ping_event(__val_type v): __val(v) {}
		operator __val_type() const { return __val; }
	private:
		__val_type __val;
	};
	
	class pong_s_event : public ::Event {
		public:
			// Constructor
			pong_s_event(bool isInternal);
			// Attributes
	};
	
	
	class Ping_state {
	public:
		enum __val_type {
			s1,
			s2
		};
		Ping_state(): __val(s1) {}
		Ping_state(__val_type v): __val(v) {}
		operator __val_type() const { return __val; }
	private:
		__val_type __val;
	};
	
	
	Ping_state current_state;
	
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
	Ping(const Ping&);
	
	// Deny copy of the class using assignment
	Ping& operator=(const Ping&);
	
	static ::std::list< ::PingPongOuter::Component::Ping* > _instances;
	
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
}; /* class Ping */
} /* namespace Component */
} /* namespace PingPongOuter */

#endif /* __PINGPONGOUTER__COMPONENT__PING_HEADER */
