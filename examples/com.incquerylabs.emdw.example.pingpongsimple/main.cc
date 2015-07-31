/******************************************************************************
 * 
 * P I N G - P O N G   S I M P L E   E X A M P L E
 * 
 * NAME: main.cc
 * 
 ******************************************************************************/

#include "PingPongSimple/Component/Component_def.hh"

int main(int , char **) {
    using namespace ::PingPongSimple::Component;

    Ping* pi = new Ping();
    Pong* po = new Pong();
    Component* comp = new Component();

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
