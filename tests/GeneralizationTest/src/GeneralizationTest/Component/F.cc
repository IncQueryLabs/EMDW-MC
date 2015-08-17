#include "GeneralizationTest/Component/F.hh"
#include "GeneralizationTest/Component/Component_def.hh"

::std::list< ::GeneralizationTest::Component::F* > (::GeneralizationTest::Component::F::_instances);

// Constructors
::GeneralizationTest::Component::F::F() : D() {
	_instances.push_back(this);
	bool result = true;
	::std::cout << "F constructor" << ::std::endl;
}

// Destructor
::GeneralizationTest::Component::F::~F() {
	_instances.remove(this);
}

void ::GeneralizationTest::Component::F::perform_initialization() {
	::std::cout << "[F] Initialization" << ::std::endl;
	// no action
}

// Operation definitions
void (::GeneralizationTest::Component::F::c_operation)(bool bool_param) {
	::std::cout << "c_operation with bool_param: " << bool_param << ::std::endl;
}


