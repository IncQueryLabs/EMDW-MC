#ifndef __GENERALIZATIONTEST__COMPONENT__A_HEADER
#define __GENERALIZATIONTEST__COMPONENT__A_HEADER

#include "GeneralizationTest/Component/Component_decl.hh"
#include "Runtime/unique_number.hh"
#include "Runtime/type_number.hh"
#include <list>
#include <queue>
#include <iostream>

namespace GeneralizationTest{
namespace Component{

class A {

public:

	
	// Constructors
	A();
	
	// Destructor
	virtual ~A();
	
	// Type id getters
	static ::unique_number __get_static_type_number() { return ::type_number<A*>::number; }
	virtual ::unique_number __get_dynamic_type_number() { return __get_static_type_number(); }
	
	// Initialization
	void perform_initialization();
	
	// Attributes
	double a_property;
	
	// Associations
	
	// Component reference
	::GeneralizationTest::Component::Component* _comp;
	
	// Operation declarations
	

protected:

	// Constructors
	
	// Destructor
	
	// Attributes
	
	// Operation declarations

private:

	// Deny copy of the class using copy constructor
	A(const A&);
	
	// Deny copy of the class using assignment
	A& operator=(const A&);
	
	static ::std::list< ::GeneralizationTest::Component::A* > _instances;
	
	// Constructors
	
	// Destructor
	
	// Attributes
	
	// Operation declarations
	
}; /* class A */
} /* namespace Component */
} /* namespace GeneralizationTest */

#endif /* __GENERALIZATIONTEST__COMPONENT__A_HEADER */
