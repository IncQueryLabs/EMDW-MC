/*
 * ActiveComponent.h
 *
 *  Created on: Jun 24, 2015
 *      Author: Robert Doczi
 */

#ifndef SRC_RUNTIME_ACTIVECOMPONENT_H_
#define SRC_RUNTIME_ACTIVECOMPONENT_H_

#include <list>

class StatefulClass;

/**
 * A component that has classes with state machine.
 */
class ActiveComponent {
public:
    virtual ~ActiveComponent() {}

    void schedule(StatefulClass* statefulClass);
    void process();

private:
    std::list<StatefulClass*> _statefulClasses;
};

#endif /* SRC_RUNTIME_ACTIVECOMPONENT_H_ */
