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


