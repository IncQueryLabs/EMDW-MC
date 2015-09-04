/*
 * active_component.hh
 *
 *  Created on: Jun 24, 2015
 *      Author: Robert Doczi
 */

#ifndef SRC_RUNTIME_ACTIVE_COMPONENT_HH_
#define SRC_RUNTIME_ACTIVE_COMPONENT_HH_

#include <list>

class stateful_class;

/**
 * A component that has classes with state machine.
 */
class active_component {
public:
    virtual ~active_component() {}

    void schedule(stateful_class* stateful_class);
    void process();

private:
    std::list<stateful_class*> _stateful_classes;
};

#endif /* SRC_RUNTIME_ACTIVE_COMPONENT_HH_ */
