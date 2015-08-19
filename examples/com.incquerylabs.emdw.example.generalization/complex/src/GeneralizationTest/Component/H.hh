#ifndef __GENERALIZATIONTEST__COMPONENT__H_HEADER
#define __GENERALIZATIONTEST__COMPONENT__H_HEADER

#include "GeneralizationTest/Component/Component_decl.hh"
#include "GeneralizationTest/Component/E.hh"
#include "GeneralizationTest/Component/F.hh"
#include "Runtime/unique_number.hh"
#include "Runtime/type_number.hh"
#include <list>
#include <queue>
#include <iostream>

namespace GeneralizationTest{
namespace Component{

class H: public ::GeneralizationTest::Component::E, public ::GeneralizationTest::Component::F {

public:

	
	// Constructors
	H();
	
	// Destructor
	virtual ~H();
	
	// Type id getters
	static ::unique_number __get_static_type_number() { return ::type_number<H*>::number; }
	virtual ::unique_number __get_dynamic_type_number() { return __get_static_type_number(); }
	
	// Initialization
	void perform_initialization();
	
	// Attributes
	
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
	H(const H&);
	
	// Deny copy of the class using assignment
	H& operator=(const H&);
	
	static ::std::list< ::GeneralizationTest::Component::H* > _instances;
	
	// Constructors
	
	// Destructor
	
	// Attributes
	
	// Operation declarations
	
}; /* class H */
} /* namespace Component */
} /* namespace GeneralizationTest */

#endif /* __GENERALIZATIONTEST__COMPONENT__H_HEADER */
