#ifndef __MODEL__COMP__PING_HEADER
#define __MODEL__COMP__PING_HEADER

#include "Comp_decl.hh"
#include "Pong.hh"
#include "../Runtime/StatefulClass.hh"
#include "../Runtime/Event.hh"
#include "list"
#include "queue"
#include "iostream"

namespace model{
namespace Comp{

class Ping : public ::StatefulClass {

public:

	
	// Constructors
	Ping();
	
	// Destructor
	virtual ~Ping();
	
	void perform_initialization();
	
	// Attributes
	
	// Associations
	::model::Comp::Pong* R1_pong;
	
	// Component reference
	::model::Comp::CompMain* _comp;
	
	// Operation declarations
	
	enum Ping_state {
		Ping_STATE_s1,
		Ping_STATE_s2
	};
	
	enum Ping_event {
		Ping_EVENT_pong_s
	};
	
	class pong_s_event : public ::Event {
		public:
			pong_s_event(bool isInternal);
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
	
	static ::std::list< Ping* > _instances;
	
	static const unsigned short type_id = 1;
	
	virtual unsigned short get_type_id() const {
		return type_id;
	}
	
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
} /* namespace Comp */
} /* namespace model */

#endif /* __MODEL__COMP__PING_HEADER */
