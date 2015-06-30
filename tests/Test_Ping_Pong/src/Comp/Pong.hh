/*
 * Pong.h
 *
 *  Created on: Jun 23, 2015
 *      Author: Robert Doczi
 */

#ifndef SRC_COMP_PONG_H_
#define SRC_COMP_PONG_H_

#include <string>
#include <queue>
#include <vector>

#include "../Runtime/StatefulClass.hh"
#include "../Runtime/Event.hh"

#include "Comp_decl.hh"

/******************************* GENERATED CODE *******************************/
namespace model{
namespace Comp{

class Pong : public StatefulClass {

public:


    // Constructors
    Pong();

    // Destructor
    virtual ~Pong();

    void perform_initialization();

    // Attributes

    // Associations
    ::model::Comp::Ping* R1_ping;

    // Operation declarations

    enum Pong_state {
        Pong_STATE_s1,
        Pong_STATE_s2
    };

    enum Pong_event {
        Pong_EVENT_ping_s
    };

    class ping_sEvent : public Event {
        public:
            ping_sEvent(bool isInternal);
    };

    Pong_state current_state;

    virtual void generateEvent(const Event* e);
    virtual void process();

    void process_event(const Event* event);

    inline const ::model::Comp::Ping* getR1_ping() const {
        return R1_ping;
    }

    inline void setR1_ping(::model::Comp::Ping* toSet) {
        R1_ping = toSet;
    }

    inline void setComponent(::model::Comp::CompMain* comp) {
        this->_comp = comp;
    }

protected:

    // Constructors

    // Destructor

    // Attributes

    // Operation declarations

private:

    // Deny copy of the class using copy constructor
    Pong(const Pong&);

    // Deny copy of the class using assignment
    Pong& operator=(const Pong&);

    static std::vector< Pong* > _instances;

    static const unsigned short type_id = 2;

    virtual unsigned short get_type_id() const {
        return type_id;
    }

    // Constructors

    // Destructor

    // Attributes

    // Operation declarations

    // s1 state

    void process_event_in_s1_state(const Event* event);

    // s2 state
    void perform_entry_action_for_s2_state(const Event* event);

    void process_event_in_s2_state(const Event* event);

    void perform_actions_on_e2_transition_from_s2_to_s1(const Event* event);

    // State queues
    std::queue<const Event*> _internalEvents, _externalEvents;

    // Component reference
    ::model::Comp::CompMain* _comp;
};
} /* namespace Comp */
} /* namespace model */


/******************************* GENERATED CODE *******************************/


#endif /* SRC_COMP_PONG_H_ */
