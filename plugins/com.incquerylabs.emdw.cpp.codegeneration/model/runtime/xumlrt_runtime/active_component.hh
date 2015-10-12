/*
 * active_component.hh
 *
 *  Created on: Jun 24, 2015
 *      Author: Robert Doczi
 */

#ifndef SRC_RUNTIME_ACTIVE_COMPONENT_HH_
#define SRC_RUNTIME_ACTIVE_COMPONENT_HH_

#include <list>

namespace xumlrt {
  class stateful_class;
  
  /**
   * A component that has classes with state machine.
   */
  class active_component {
  public:
    virtual ~active_component() {}
  
    std::list<stateful_class*>::iterator schedule(stateful_class* stateful_class);
    void unschedule(std::list<stateful_class*>::iterator position);

    void process();
  
  private:
    std::list<stateful_class*> _stateful_classes;
  };
}
#endif /* SRC_RUNTIME_ACTIVE_COMPONENT_HH_ */
