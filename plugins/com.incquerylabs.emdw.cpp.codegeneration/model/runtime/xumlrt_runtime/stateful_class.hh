/*
 * stateful_class.hh
 *
 *  Created on: Jun 23, 2015
 *      Author: Robert Doczi
 */

#ifndef __XUMLRT_RUNTIME_STATEFUL_CLASS_HH_
#define __XUMLRT_RUNTIME_STATEFUL_CLASS_HH_

 #include <list>

namespace xumlrt {
  class event;
  
  class stateful_class {
  public:
    virtual ~stateful_class() {}
  
    virtual void generate_internal_event(const event* e) = 0;
    virtual void generate_external_event(const event* e) = 0;
    virtual void process() = 0;
  
  protected:
  	std::list<stateful_class*>::iterator _scheduler_queue_position;

  private:
  };
}

#endif
