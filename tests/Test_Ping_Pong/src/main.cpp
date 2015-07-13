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

