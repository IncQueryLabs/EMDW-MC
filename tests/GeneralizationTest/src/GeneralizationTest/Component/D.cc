#include "GeneralizationTest/Component/D.hh"
#include "GeneralizationTest/Component/Component_def.hh"

::std::list< ::GeneralizationTest::Component::D* > (::GeneralizationTest::Component::D::_instances);

// Constructors
::GeneralizationTest::Component::D::D() : ::GeneralizationTest::Component::C::C(), A() {
	_instances.push_back(this);
	bool result = true;
	::std::cout << "D constructor" << ::std::endl;
}

// Destructor
::GeneralizationTest::Component::D::~D() {
	_instances.remove(this);
}

void ::GeneralizationTest::Component::D::perform_initialization() {
	::std::cout << "[D] Initialization" << ::std::endl;
	// no action
}

// Operation definitions
void (::GeneralizationTest::Component::D::d_operation)() {
	::std::cout << "d_operation" << ::std::endl;
}


