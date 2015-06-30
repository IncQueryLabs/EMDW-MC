/*
 * main.cpp
 *
 *  Created on: Jun 23, 2015
 *      Author: Robert Doczi
 */




#include "Comp/Ping.hh"
#include "Comp/Pong.hh"

int main(int , char **) {
    using namespace model::Comp;

    Ping* pi = new Ping();
    Pong* po = new Pong();
    CompMain* comp = new CompMain();

    pi->R1_pong = po;
    po->R1_ping = pi;

    pi->setComponent(comp);
    po->setComponent(comp);

    pi->perform_initialization();
    po->perform_initialization();

    for (int i = 0; i < 20; ++i) {
        comp->process();
    }

    delete pi;
    delete po;
    delete comp;
}

