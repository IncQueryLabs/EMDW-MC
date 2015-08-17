#include "GeneralizationTest/Component/E.hh"
#include "GeneralizationTest/Component/Component_def.hh"

::std::list< ::GeneralizationTest::Component::E* > (::GeneralizationTest::Component::E::_instances);

// Constructors
::GeneralizationTest::Component::E::E() : GeneralizationTest::Component::D::D() {
	_instances.push_back(this);
	bool result = true;
	::std::cout << "E constructor" << ::std::endl;
}

// Destructor
::GeneralizationTest::Component::E::~E() {
	_instances.remove(this);
}

void ::GeneralizationTest::Component::E::perform_initialization() {
	::std::cout << "[E] Initialization" << ::std::endl;
	// no action
}

// Operation definitions
void (::GeneralizationTest::Component::E::d_operation)() {
	::std::cout << "d_operation in E" << ::std::endl;
}


