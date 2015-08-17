#ifndef __GENERALIZATIONTEST__COMPONENT__C_HEADER
#define __GENERALIZATIONTEST__COMPONENT__C_HEADER

#include "GeneralizationTest/Component/Component_decl.hh"
#include "Runtime/unique_number.hh"
#include "Runtime/type_number.hh"
#include <list>
#include <queue>
#include <iostream>

namespace GeneralizationTest{
namespace Component{

class C {

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
	
}; /* class C */
} /* namespace Component */
} /* namespace GeneralizationTest */

#endif /* __GENERALIZATIONTEST__COMPONENT__C_HEADER */
