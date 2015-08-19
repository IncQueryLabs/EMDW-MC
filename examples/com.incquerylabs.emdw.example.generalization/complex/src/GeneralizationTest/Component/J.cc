#include "GeneralizationTest/Component/J.hh"
#include "GeneralizationTest/Component/Component_def.hh"

::std::list< ::GeneralizationTest::Component::J* > (::GeneralizationTest::Component::J::_instances);

// Constructors
::GeneralizationTest::Component::J::J(): ::GeneralizationTest::Component::F(), ::GeneralizationTest::Component::C() {
	_instances.push_back(this);
	bool result = true;
}

// Destructor
::GeneralizationTest::Component::J::~J() {
	_instances.remove(this);
}

void ::GeneralizationTest::Component::J::perform_initialization() {
	::std::cout << "[J] Initialization" << ::std::endl;
	// no action
}


