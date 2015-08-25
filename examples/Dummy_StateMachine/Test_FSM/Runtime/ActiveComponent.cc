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
