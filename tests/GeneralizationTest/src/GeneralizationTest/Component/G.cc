#include "GeneralizationTest/Component/G.hh"
#include "GeneralizationTest/Component/Component_def.hh"

::std::list< ::GeneralizationTest::Component::G* > (::GeneralizationTest::Component::G::_instances);

// Constructors
::GeneralizationTest::Component::G::G() : ::GeneralizationTest::Component::C::C() {
	_instances.push_back(this);
	bool result = true;
	::std::cout << "G constructor" << ::std::endl;
}

// Destructor
::GeneralizationTest::Component::G::~G() {
	_instances.remove(this);
}

void ::GeneralizationTest::Component::G::perform_initialization() {
	::std::cout << "[G] Initialization" << ::std::endl;
	// no action
}



