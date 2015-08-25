#ifndef __MODEL__COMP__PONG_HEADER
#define __MODEL__COMP__PONG_HEADER

#include "Comp_decl.hh"
#include "Ping.hh"
#include "../Runtime/StatefulClass.hh"
#include "../Runtime/Event.hh"
#include "list"
#include "queue"
#include "iostream"

namespace model{
namespace Comp{

class Pong : public ::StatefulClass {

public:

	
	// Constructors
	Pong();
	
	// Destructor
	virtual ~Pong();
	
	void perform_initialization();
	
	// Attributes
	
	// Associations
	::model::Comp::Ping* R1_ping;
	
	// Component reference
	::model::Comp::Comp* _comp;
	
	// Operation declarations
	
	enum Pong_state {
		Pong_STATE_s1,
		Pong_STATE_s2
	};
	
	enum Pong_event {
		Pong_EVENT_ping_s
	};
	
	class ping_s_event : public ::Event {
		public:
			ping_s_event(bool isInternal);
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
	
	static ::std::list< Pong* > _instances;
	
	static const unsigned short type_id = 2;
	
	virtual unsigned short get_type_id() const {
		return type_id;
	}
	
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
} /* namespace Comp */
} /* namespace model */

#endif /* __MODEL__COMP__PONG_HEADER */
