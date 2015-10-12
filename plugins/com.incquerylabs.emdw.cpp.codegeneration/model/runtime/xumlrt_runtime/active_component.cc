/*
 * active_component.cc
 *
 *  Created on: Jun 24, 2015
 *      Author: Robert Doczi
 */

#include "active_component.hh"
#include "stateful_class.hh"

std::list< ::xumlrt::stateful_class*>::iterator (::xumlrt::active_component::schedule)(stateful_class* stateful_class) {
    _stateful_classes.push_back(stateful_class);
    return --_stateful_classes.end();
}

void ::xumlrt::active_component::unschedule(std::list<stateful_class*>::iterator position) {
	_stateful_classes.erase(position);
}

void ::xumlrt::active_component::process() {
  if(!_stateful_classes.empty()) {
    stateful_class *sc = _stateful_classes.front();
    _stateful_classes.pop_front();
    sc->process();
  }
}
