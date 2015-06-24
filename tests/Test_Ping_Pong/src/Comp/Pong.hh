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

namespace model {
namespace Comp {


class Pong : public StatefulClass {

public:


    // Constructor
    Pong();

    // Destructor
    virtual ~Pong();

    void perform_initialization();

    // Attributes

    // Operation declarations

    enum Pong_state {
        Pong_STATE_s1,
        Pong_STATE_s2
    };
    enum Pong_event {
        Pong_EVENT_ping_s
    };
    class PongEvent : public Event {
    public:
        PongEvent(bool isInternal);
    };

    Pong_state current_state;


    virtual void generateEvent(const Event* e);
    virtual void process();

    // int instead of Pong_event since we probably have no idea it is an event we can process
    void process_event(const Event* event);

    inline const ::model::Comp::Ping* getR1Ping() const {
        return R1_ping;
    }

    inline void setR1Ping(::model::Comp::Ping* r1Ping) {
        R1_ping = r1Ping;
    }

    inline void setComponent(::model::Comp::CompMain* comp) {
        this->_comp = comp;
    }

protected:

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

    // Attributes
    // Associations
    ::model::Comp::Ping* R1_ping;

    // Operation declarations

    // s1 state

    void process_event_in_s1_state(const Event* event);

    // s2 state

    void perform_entry_action_for_s2_state(const Event* event);

    void process_event_in_s2_state(const Event* event);

    void perform_actions_on_e2_transition_from_s2_to_s1(const Event* event);;


    // State queues
    std::queue<const Event*> _internalEvents, _externalEvents;

    // Component reference
    ::model::Comp::CompMain* _comp;
};

} /* namespace Comp */
} /* namespace model */

#endif /* SRC_COMP_PONG_H_ */
