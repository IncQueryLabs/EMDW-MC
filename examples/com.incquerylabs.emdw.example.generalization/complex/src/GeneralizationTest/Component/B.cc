/*******************************************************************************
 * Copyright (c) 2015-2016 IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
#include "GeneralizationTest/Component/B.hh"
#include "GeneralizationTest/Component/Component_def.hh"

::std::list< ::GeneralizationTest::Component::B* > (::GeneralizationTest::Component::B::_instances);

// Constructors
::GeneralizationTest::Component::B::B(): ::GeneralizationTest::Component::A() {
	_instances.push_back(this);
	bool result = true;
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
::std::string (::GeneralizationTest::Component::B::b_operation)() {
	::std::cout << "b_operation";
	return "ss";
}


