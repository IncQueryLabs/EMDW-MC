/*
 * active_component.cc
 *
 *  Created on: Jun 24, 2015
 *      Author: Robert Doczi
 */

#include "active_component.hh"
#include "stateful_class.hh"

void active_component::schedule(stateful_class* stateful_class) {
    _stateful_classes.push_back(stateful_class);
}

void active_component::process() {
    if(!_stateful_classes.empty()) {
        stateful_class *sc = _stateful_classes.front();
        _stateful_classes.pop_front();
        sc->process();
    }
}
