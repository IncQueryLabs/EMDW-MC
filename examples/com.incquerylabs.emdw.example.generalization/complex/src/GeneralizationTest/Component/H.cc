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



