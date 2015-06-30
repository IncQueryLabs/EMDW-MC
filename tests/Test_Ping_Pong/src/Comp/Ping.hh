/*
 * Ping.h
 *
 *  Created on: Jun 23, 2015
 *      Author: Robert Doczi
 */

#ifndef SRC_COMP_PING_H_
#define SRC_COMP_PING_H_

#include <string>
#include <queue>
#include <vector>

#include "../Runtime/StatefulClass.hh"
#include "../Runtime/Event.hh"

#include "Comp_decl.hh"

/******************************* GENERATED CODE *******************************/
namespace model{
namespace Comp{

class Ping : public StatefulClass {

public:

    
    // Constructors
    Ping();
    
    // Destructor
    virtual ~Ping();
    
    void perform_initialization();
    
    // Attributes
    
    // Associations
    ::model::Comp::Pong* R1_pong;

    // Operation declarations
    
    enum Ping_state {
        Ping_STATE_s1,
        Ping_STATE_s2
    };
    
    enum Ping_event {
        Ping_EVENT_pong_s
    };
    
    class pong_sEvent : public Event {
        public:
            pong_sEvent(bool isInternal);
    };
    
    
    Ping_state current_state;
    
    virtual void generateEvent(const Event* e);
    virtual void process();
    
    void process_event(const Event* event);
    
    inline const ::model::Comp::Pong* getR1_pong() const {
        return R1_pong;
    }
    
    inline void setR1_pong(::model::Comp::Pong* toSet) {
        R1_pong = toSet;
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
    Ping(const Ping&);
    
    // Deny copy of the class using assignment
    Ping& operator=(const Ping&);
    
    static std::vector< Ping* > _instances;
    
    static const unsigned short type_id = 1;
    
    virtual unsigned short get_type_id() const {
        return type_id;
    }
    
    // Constructors
    
    // Destructor
    
    // Attributes
    
    
    // Operation declarations
    
    // s1 state
    void perform_entry_action_for_s1_state(const Event* event);
    
    void process_event_in_s1_state(const Event* event);
    
    // s2 state
    void perform_entry_action_for_s2_state(const Event* event);
    
    void process_event_in_s2_state(const Event* event);
    
    // State queues
    std::queue<const Event*> _internalEvents, _externalEvents;
    
    // Component reference
    ::model::Comp::CompMain* _comp;
};
} /* namespace Comp */
} /* namespace model */

/******************************* GENERATED CODE *******************************/


#endif /* SRC_COMP_PING_H_ */
