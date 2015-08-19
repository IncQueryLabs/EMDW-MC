#ifndef __GENERALIZATIONTEST__COMPONENT__C_HEADER
#define __GENERALIZATIONTEST__COMPONENT__C_HEADER

#include "GeneralizationTest/Component/Component_decl.hh"
#include "Runtime/StatefulClass.hh"
#include "Runtime/Event.hh"
#include "Runtime/unique_number.hh"
#include "Runtime/type_number.hh"
#include <list>
#include <queue>
#include <iostream>

namespace GeneralizationTest{
namespace Component{

class C: public ::StatefulClass {

public:

	
	// Constructors
	C();
	
	// Destructor
	virtual ~C();
	
	// Type id getters
	static ::unique_number __get_static_type_number() { return ::type_number<C*>::number; }
	virtual ::unique_number __get_dynamic_type_number() { return __get_static_type_number(); }
	
	// Initialization
	void perform_initialization();
	
	// Attributes
	
	// Associations
	
	// Component reference
	::GeneralizationTest::Component::Component* _comp;
	
	// Operation declarations
	void c_operation();
	
	enum C_state {
		C_STATE_a
	};
	
	enum C_event {
	};
	
	
	
	C_state current_state;
	
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
	C(const C&);
	
	// Deny copy of the class using assignment
	C& operator=(const C&);
	
	static ::std::list< ::GeneralizationTest::Component::C* > _instances;
	
	// Constructors
	
	// Destructor
	
	// Attributes
	
	// Operation declarations
	
	// a state
	
	void process_event_in_a_state(const ::Event* event);
	
	// State queues
	::std::queue<const ::Event*> _internalEvents, _externalEvents;
}; /* class C */
} /* namespace Component */
} /* namespace GeneralizationTest */

#endif /* __GENERALIZATIONTEST__COMPONENT__C_HEADER */
