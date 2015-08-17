#include "GeneralizationTest/Component/C.hh"
#include "GeneralizationTest/Component/Component_def.hh"

::std::list< ::GeneralizationTest::Component::C* > (::GeneralizationTest::Component::C::_instances);

// Constructors
::GeneralizationTest::Component::C::C() {
	_instances.push_back(this);
	bool result = true;
	::std::cout << "C constructor" << ::std::endl;
}

// Destructor
::GeneralizationTest::Component::C::~C() {
	_instances.remove(this);
}

void ::GeneralizationTest::Component::C::perform_initialization() {
	::std::cout << "[C] Initialization" << ::std::endl;
	// no action
}

// Operation definitions
void (::GeneralizationTest::Component::C::c_operation)() {
	::std::cout << "c_operation" << ::std::endl;
}


