#ifndef __GENERALIZATIONTEST__COMPONENT__J_HEADER
#define __GENERALIZATIONTEST__COMPONENT__J_HEADER

#include "GeneralizationTest/Component/Component_decl.hh"
#include "GeneralizationTest/Component/F.hh"
#include "GeneralizationTest/Component/C.hh"
#include "Runtime/unique_number.hh"
#include "Runtime/type_number.hh"
#include <list>
#include <queue>
#include <iostream>

namespace GeneralizationTest{
namespace Component{

class J: public ::GeneralizationTest::Component::F {

public:

	
	// Constructors
	J();
	
	// Destructor
	virtual ~J();
	
	// Type id getters
	static ::unique_number __get_static_type_number() { return ::type_number<J*>::number; }
	virtual ::unique_number __get_dynamic_type_number() { return __get_static_type_number(); }
	
	// Initialization
	void perform_initialization();
	
	// Attributes
	
	// Associations
	
	// Component reference
	::GeneralizationTest::Component::Component* _comp;

protected:

	// Constructors
	
	// Destructor
	
	// Attributes
	
	// Operation declarations

private:

	// Deny copy of the class using copy constructor
	J(const J&);
	
	// Deny copy of the class using assignment
	J& operator=(const J&);
	
	static ::std::list< ::GeneralizationTest::Component::J* > _instances;
	
	// Constructors
	
	// Destructor
	
	// Attributes
	
	// Operation declarations
	
}; /* class J */
} /* namespace Component */
} /* namespace GeneralizationTest */

#endif /* __GENERALIZATIONTEST__COMPONENT__J_HEADER */
