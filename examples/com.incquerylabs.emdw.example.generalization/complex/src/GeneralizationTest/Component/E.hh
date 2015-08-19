#ifndef __GENERALIZATIONTEST__COMPONENT__E_HEADER
#define __GENERALIZATIONTEST__COMPONENT__E_HEADER

#include "GeneralizationTest/Component/Component_decl.hh"
#include "GeneralizationTest/Component/D.hh"
#include "Runtime/unique_number.hh"
#include "Runtime/type_number.hh"
#include <list>
#include <queue>
#include <iostream>

namespace GeneralizationTest{
namespace Component{

class E: public virtual ::GeneralizationTest::Component::D {

public:

	
	// Constructors
	E();
	
	// Destructor
	virtual ~E();
	
	// Type id getters
	static ::unique_number __get_static_type_number() { return ::type_number<E*>::number; }
	virtual ::unique_number __get_dynamic_type_number() { return __get_static_type_number(); }
	
	// Initialization
	void perform_initialization();
	
	// Attributes
	
	// Associations
	
	// Component reference
	::GeneralizationTest::Component::Component* _comp;
	
	// Operation declarations
	virtual void d_operation();
	

protected:

	// Constructors
	
	// Destructor
	
	// Attributes
	
	// Operation declarations

private:

	// Deny copy of the class using copy constructor
	E(const E&);
	
	// Deny copy of the class using assignment
	E& operator=(const E&);
	
	static ::std::list< ::GeneralizationTest::Component::E* > _instances;
	
	// Constructors
	
	// Destructor
	
	// Attributes
	
	// Operation declarations
	
}; /* class E */
} /* namespace Component */
} /* namespace GeneralizationTest */

#endif /* __GENERALIZATIONTEST__COMPONENT__E_HEADER */
