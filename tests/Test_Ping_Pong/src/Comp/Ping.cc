/*
 * Ping.cpp
 *
 *  Created on: Jun 23, 2015
 *      Author: Robert Doczi
 */

#include "Ping.hh"

#include <algorithm>
#include <iostream>

#include "Comp_def.hh"

using namespace std;

std::vector< ::model::Comp::Ping*> (::model::Comp::Ping::_instances);

// Constructor
::model::Comp::Ping::Ping(): current_state(Ping_STATE_s1) {
    _instances.push_back(this);
}

// Destructor
::model::Comp::Ping::~Ping() {
    _instances.erase(std::find(_instances.begin(), _instances.end(), this));
}

void ::model::Comp::Ping::perform_initialization() {
    cout << "[Ping] Initialization" << endl;
    // execute actions
    /* Original  action code source:
        po.generateEvent(new PingEvent(false));
    */
    R1_pong->generateEvent(new PingEvent(false));
}

void model::Comp::Ping::generateEvent(const Event* e) {
    if(e->_isInternal) {
        _internalEvents.push(e);
    } else {
        _externalEvents.push(e);
    }
    if(_internalEvents.size() + _externalEvents.size() == 1) {
        _comp->schedule(this);
    }
}

void model::Comp::Ping::process() {
    const Event* evt;
    if(!_internalEvents.empty()) {
        evt = _internalEvents.front();
        _internalEvents.pop();
    } else {
        evt = _externalEvents.front();
        _externalEvents.pop();
    }
    if(!_internalEvents.empty() or !_externalEvents.empty()) {
        _comp->schedule(this);
    }
    process_event(evt);
}


void ::model::Comp::Ping::process_event(const Event* event) {
    cout << "[Ping] Event " << event->_id << " received." << endl;

    switch(current_state){
    case Ping_STATE_s1:
        process_event_in_s1_state(event);
        break;
    case Ping_STATE_s2:
        process_event_in_s2_state(event);
        break;
    }

}

// s1 state

void ::model::Comp::Ping::perform_entry_action_for_s1_state(const Event* event){
    cout << "    [Entry: INIT]" << endl;
    /* Original  action code source:
        po.generateEvent(new PingEvent(false));
    */
    R1_pong->generateEvent(new PingEvent(false));
}

void ::model::Comp::Ping::process_event_in_s1_state(const Event* event){
    cout << "  [State: s1] Processing event" << endl;
    // s1 -pong-> s2 transition
    if(event->_id == Ping_EVENT_pong_s) {
        // no exit action

        // no transition action

        // no entry action
        perform_entry_action_for_s2_state(event);

        // state change
        current_state = Ping_STATE_s2;
        cout << "    State changed to s2" << endl;
    } else
    {
        // event not processed in state
        cout << "    [UNPROCESSED] Event cannot be processed in this state" << endl;
    }
    return;
}


// s2 state

void ::model::Comp::Ping::perform_entry_action_for_s2_state(const Event* event){
    cout << "    [Entry: INIT]" << endl;
    /* Original  action code source:
        po.generateEvent(new PingEvent(false));
    */
    R1_pong->generateEvent(new PingEvent(false));
}

void ::model::Comp::Ping::process_event_in_s2_state(const Event* event){
    cout << "  [State: s2] Processing event" << endl;
    // s2 -pong-> s1 transition
    if(event->_id == Ping_EVENT_pong_s) {
        // no exit action

        // no transition action

        // no entry action
        perform_entry_action_for_s1_state(event);

        // state change
        current_state = Ping_STATE_s1;
        cout << "    State changed to s1" << endl;
    } else
    {
        // event not processed in state
        cout << "    [UNPROCESSED] Event cannot be processed in this state" << endl;
    }
    return;
}

model::Comp::Ping::PingEvent::PingEvent(bool isInternal) :
    Event(Pong::Pong_EVENT_ping_s, isInternal){
}
