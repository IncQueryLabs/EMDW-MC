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
/*
 * ActiveComponent.cpp
 *
 *  Created on: Jun 24, 2015
 *      Author: Robert Doczi
 */

#include "ActiveComponent.hh"
#include "StatefulClass.hh"

void ActiveComponent::schedule(StatefulClass* statefulClass) {
    _statefulClasses.push_back(statefulClass);
}

void ActiveComponent::process() {
    if(!_statefulClasses.empty()) {
        StatefulClass *sc = _statefulClasses.front();
        _statefulClasses.pop_front();
        sc->process();
    }
}
