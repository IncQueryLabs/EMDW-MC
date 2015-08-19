#include "GeneralizationTest/Component/H.hh"
#include "GeneralizationTest/Component/Component_def.hh"

::std::list< ::GeneralizationTest::Component::H* > (::GeneralizationTest::Component::H::_instances);

// Constructors
::GeneralizationTest::Component::H::H(): ::GeneralizationTest::Component::E(), ::GeneralizationTest::Component::F() {
	_instances.push_back(this);
	bool result = true;
}

// Destructor
::GeneralizationTest::Component::H::~H() {
	_instances.remove(this);
}

void ::GeneralizationTest::Component::H::perform_initialization() {
	::std::cout << "[H] Initialization" << ::std::endl;
	// no action
}



