#ifndef __GENERALIZATIONTEST__COMPONENT__B_HEADER
#define __GENERALIZATIONTEST__COMPONENT__B_HEADER

#include "GeneralizationTest/Component/Component_decl.hh"
#include "GeneralizationTest/Component/A.hh"
#include "Runtime/unique_number.hh"
#include "Runtime/type_number.hh"
#include <list>
#include <queue>
#include <iostream>
#include <string>

namespace GeneralizationTest{
namespace Component{

class B : public A {

public:

	
	// Constructors
	B();
	
	// Destructor
	virtual ~B();
	
	// Type id getters
	static ::unique_number __get_static_type_number() { return ::type_number<B*>::number; }
	virtual ::unique_number __get_dynamic_type_number() { return __get_static_type_number(); }
	
	// Initialization
	void perform_initialization();
	
	// Attributes
	::std::string b_property;
	
	// Associations
	
	// Component reference
	::GeneralizationTest::Component::Component* _comp;
	
	// Operation declarations
	void b_operation();
	

protected:

	// Constructors
	
	// Destructor
	
	// Attributes
	
	// Operation declarations

private:

	// Deny copy of the class using copy constructor
	B(const B&);
	
	// Deny copy of the class using assignment
	B& operator=(const B&);
	
	static ::std::list< ::GeneralizationTest::Component::B* > _instances;
	
	// Constructors
	
	// Destructor
	
	// Attributes
	
	// Operation declarations
	
}; /* class B */
} /* namespace Component */
} /* namespace GeneralizationTest */

#endif /* __GENERALIZATIONTEST__COMPONENT__B_HEADER */
