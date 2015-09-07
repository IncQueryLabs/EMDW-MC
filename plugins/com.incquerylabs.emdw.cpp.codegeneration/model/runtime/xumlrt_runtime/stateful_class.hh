/*
 * stateful_class.hh
 *
 *  Created on: Jun 23, 2015
 *      Author: Robert Doczi
 */

#ifndef SRC_RUNTIME_STATEFUL_CLASS_HH_
#define SRC_RUNTIME_STATEFUL_CLASS_HH_

class event;

class stateful_class {
public:
    virtual ~stateful_class() {}

    virtual void generate_event(const event* e) = 0;
    virtual void process() = 0;

private:
};


#endif /* SRC_RUNTIME_STATEFULCLASS_HH_ */
