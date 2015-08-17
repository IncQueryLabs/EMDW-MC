#ifndef __GENERALIZATIONTEST__COMPONENT__F_HEADER
#define __GENERALIZATIONTEST__COMPONENT__F_HEADER

#include "GeneralizationTest/Component/Component_decl.hh"
#include "GeneralizationTest/Component/D.hh"
#include "Runtime/unique_number.hh"
#include "Runtime/type_number.hh"
#include <list>
#include <queue>
#include <iostream>

namespace GeneralizationTest{
namespace Component{

class F : public ::GeneralizationTest::Component::D {

public:

	
	// Constructors
	F();
	
	// Destructor
	virtual ~F();
	
	// Type id getters
	static ::unique_number __get_static_type_number() { return ::type_number<F*>::number; }
	virtual ::unique_number __get_dynamic_type_number() { return __get_static_type_number(); }
	
	// Initialization
	void perform_initialization();
	
	// Attributes
	
	// Associations
	
	// Component reference
	::GeneralizationTest::Component::Component* _comp;
	
	// Operation declarations
	void c_operation(bool bool_param);
	

protected:

	// Constructors
	
	// Destructor
	
	// Attributes
	
	// Operation declarations

private:

	// Deny copy of the class using copy constructor
	F(const F&);
	
	// Deny copy of the class using assignment
	F& operator=(const F&);
	
	static ::std::list< ::GeneralizationTest::Component::F* > _instances;
	
	// Constructors
	
	// Destructor
	
	// Attributes
	
	// Operation declarations
	
}; /* class F */
} /* namespace Component */
} /* namespace GeneralizationTest */

#endif /* __GENERALIZATIONTEST__COMPONENT__F_HEADER */
