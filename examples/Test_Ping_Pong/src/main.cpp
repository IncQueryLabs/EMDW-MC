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
 * main.cpp
 *
 *  Created on: Jun 23, 2015
 *      Author: Robert Doczi
 */

#include "Comp/Comp_def.hh"

int main(int , char **) {
    using namespace model::Comp;

    Ping* pi = new Ping();
    Pong* po = new Pong();
    Comp* comp = new Comp();

    pi->R1_pong = po;
    po->R1_ping = pi;

    pi->_comp = comp;
    po->_comp = comp;

    pi->perform_initialization();
    po->perform_initialization();

    for (int i = 0; i < 20; ++i) {
        comp->process();
    }

    delete pi;
    delete po;
    delete comp;
}

