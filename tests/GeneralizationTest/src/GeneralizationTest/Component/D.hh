#ifndef __GENERALIZATIONTEST__COMPONENT__D_HEADER
#define __GENERALIZATIONTEST__COMPONENT__D_HEADER

#include "GeneralizationTest/Component/Component_decl.hh"
#include "GeneralizationTest/Component/C.hh"
#include "GeneralizationTest/Component/A.hh"
#include "Runtime/unique_number.hh"
#include "Runtime/type_number.hh"
#include <list>
#include <queue>
#include <iostream>

namespace GeneralizationTest{
namespace Component{

class D : public C, public A {

public:

	
	// Constructors
	D();
	
	// Destructor
	virtual ~D();
	
	// Type id getters
	static ::unique_number __get_static_type_number() { return ::type_number<D*>::number; }
	virtual ::unique_number __get_dynamic_type_number() { return __get_static_type_number(); }
	
	// Initialization
	void perform_initialization();
	
	// Attributes
	
	// Associations
	
	// Component reference
	::GeneralizationTest::Component::Component* _comp;
	
	// Operation declarations
	void d_operation();
	

protected:

	// Constructors
	
	// Destructor
	
	// Attributes
	
	// Operation declarations

private:

	// Deny copy of the class using copy constructor
	D(const D&);
	
	// Deny copy of the class using assignment
	D& operator=(const D&);
	
	static ::std::list< ::GeneralizationTest::Component::D* > _instances;
	
	// Constructors
	
	// Destructor
	
	// Attributes
	
	// Operation declarations
	
}; /* class D */
} /* namespace Component */
} /* namespace GeneralizationTest */

#endif /* __GENERALIZATIONTEST__COMPONENT__D_HEADER */
