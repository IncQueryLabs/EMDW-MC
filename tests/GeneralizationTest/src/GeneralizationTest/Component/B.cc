#include "GeneralizationTest/Component/B.hh"
#include "GeneralizationTest/Component/Component_def.hh"

::std::list< ::GeneralizationTest::Component::B* > (::GeneralizationTest::Component::B::_instances);

// Constructors
::GeneralizationTest::Component::B::B() : A(){
	_instances.push_back(this);
	bool result = true;
	::std::cout << "B constructor" << ::std::endl;
}

// Destructor
::GeneralizationTest::Component::B::~B() {
	_instances.remove(this);
}

void ::GeneralizationTest::Component::B::perform_initialization() {
	::std::cout << "[B] Initialization" << ::std::endl;
	// no action
}

// Operation definitions
void (::GeneralizationTest::Component::B::b_operation)() {
	::std::cout << "b_operation" << ::std::endl;
}


