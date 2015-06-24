/*
 * StatefulClass.h
 *
 *  Created on: Jun 23, 2015
 *      Author: Robert Doczi
 */

#ifndef SRC_RUNTIME_STATEFULCLASS_H_
#define SRC_RUNTIME_STATEFULCLASS_H_

class Event;

class StatefulClass {
public:
    virtual ~StatefulClass() {}

    virtual void generateEvent(const Event* e) = 0;
    virtual void process() = 0;

private:
};


#endif /* SRC_RUNTIME_STATEFULCLASS_H_ */
