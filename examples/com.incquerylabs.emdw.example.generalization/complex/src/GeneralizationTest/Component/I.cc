#include "GeneralizationTest/Component/I.hh"
#include "GeneralizationTest/Component/Component_def.hh"

::std::list< ::GeneralizationTest::Component::I* > (::GeneralizationTest::Component::I::_instances);

// Constructors
::GeneralizationTest::Component::I::I(): ::GeneralizationTest::Component::E(), ::GeneralizationTest::Component::G() {
	_instances.push_back(this);
	bool result = true;
}

// Destructor
::GeneralizationTest::Component::I::~I() {
	_instances.remove(this);
}

void ::GeneralizationTest::Component::I::perform_initialization() {
	::std::cout << "[I] Initialization" << ::std::endl;
	// no action
}

// Operation definitions
void (::GeneralizationTest::Component::I::d_operation)() {
	::std::cout << "d_operation in I" << ::std::endl;
}


