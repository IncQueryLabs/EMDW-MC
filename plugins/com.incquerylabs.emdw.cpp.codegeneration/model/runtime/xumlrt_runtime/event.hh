/*
 * event.hh
 *
 *  Created on: Jun 23, 2015
 *      Author: Robert Doczi
 */

#ifndef SRC_RUNTIME_EVENT_HH_
#define SRC_RUNTIME_EVENT_HH_

class event {
public:
	event(int id, bool isInternal) :
        _id(id), _isInternal(isInternal) {
    }

    virtual ~event() {}

    int _id;
    bool _isInternal;
private:
    event(const event&);
    event& operator=(const event&);
};

#endif /* SRC_RUNTIME_EVENT_HH_ */
