#ifndef __GENERALIZATIONTEST__COMPONENT__G_HEADER
#define __GENERALIZATIONTEST__COMPONENT__G_HEADER

#include "GeneralizationTest/Component/Component_decl.hh"
#include "GeneralizationTest/Component/C.hh"
#include "Runtime/unique_number.hh"
#include "Runtime/type_number.hh"
#include <list>
#include <queue>
#include <iostream>

namespace GeneralizationTest{
namespace Component{

class G: public virtual ::GeneralizationTest::Component::C {

public:

	
	// Constructors
	G();
	
	// Destructor
	virtual ~G();
	
	// Type id getters
	static ::unique_number __get_static_type_number() { return ::type_number<G*>::number; }
	virtual ::unique_number __get_dynamic_type_number() { return __get_static_type_number(); }
	
	// Initialization
	void perform_initialization();
	
	// Attributes
	long g_property;
	
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
	G(const G&);
	
	// Deny copy of the class using assignment
	G& operator=(const G&);
	
	static ::std::list< ::GeneralizationTest::Component::G* > _instances;
	
	// Constructors
	
	// Destructor
	
	// Attributes
	
	// Operation declarations
	
}; /* class G */
} /* namespace Component */
} /* namespace GeneralizationTest */

#endif /* __GENERALIZATIONTEST__COMPONENT__G_HEADER */
