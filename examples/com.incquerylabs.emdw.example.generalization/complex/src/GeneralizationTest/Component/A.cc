#include "GeneralizationTest/Component/A.hh"
#include "GeneralizationTest/Component/Component_def.hh"

::std::list< ::GeneralizationTest::Component::A* > (::GeneralizationTest::Component::A::_instances);

// Constructors
::GeneralizationTest::Component::A::A() {
	_instances.push_back(this);
	bool result = true;
}

// Destructor
::GeneralizationTest::Component::A::~A() {
	_instances.remove(this);
}

void ::GeneralizationTest::Component::A::perform_initialization() {
	::std::cout << "[A] Initialization" << ::std::endl;
	// no action
}



