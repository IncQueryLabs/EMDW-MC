#ifndef __GENERALIZATIONTEST__COMPONENT__I_HEADER
#define __GENERALIZATIONTEST__COMPONENT__I_HEADER

#include "GeneralizationTest/Component/Component_decl.hh"
#include "GeneralizationTest/Component/G.hh"
#include "GeneralizationTest/Component/E.hh"
#include "Runtime/unique_number.hh"
#include "Runtime/type_number.hh"
#include <list>
#include <queue>
#include <iostream>

namespace GeneralizationTest{
namespace Component{

class I: public ::GeneralizationTest::Component::E, public ::GeneralizationTest::Component::G {

public:

	
	// Constructors
	I();
	
	// Destructor
	virtual ~I();
	
	// Type id getters
	static ::unique_number __get_static_type_number() { return ::type_number<I*>::number; }
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
	I(const I&);
	
	// Deny copy of the class using assignment
	I& operator=(const I&);
	
	static ::std::list< ::GeneralizationTest::Component::I* > _instances;
	
	// Constructors
	
	// Destructor
	
	// Attributes
	
	// Operation declarations
	
}; /* class I */
} /* namespace Component */
} /* namespace GeneralizationTest */

#endif /* __GENERALIZATIONTEST__COMPONENT__I_HEADER */
