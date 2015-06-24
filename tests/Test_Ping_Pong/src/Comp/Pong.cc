/*
 * Pong.cpp
 *
 *  Created on: Jun 23, 2015
 *      Author: Robert Doczi
 */

#include "Pong.hh"

#include <algorithm>
#include <iostream>

#include "Comp_def.hh"

using namespace std;


std::vector< ::model::Comp::Pong*> (::model::Comp::Pong::_instances);

// Constructor
::model::Comp::Pong::Pong(): current_state(Pong_STATE_s1) {
    _instances.push_back(this);
}

// Destructor
::model::Comp::Pong::~Pong() {
    _instances.erase(std::find(_instances.begin(), _instances.end(), this));
}

void ::model::Comp::Pong::perform_initialization() {
    cout << "[Pong] Initialization" << endl;
    // execute actions

}

void model::Comp::Pong::generateEvent(const Event* e) {
    if(e->_isInternal) {
        _internalEvents.push(e);
    } else {
        _externalEvents.push(e);
    }
    if(_internalEvents.size()+_externalEvents.size() == 1) {
        _comp->schedule(this);
    }
}

void model::Comp::Pong::process() {
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

void ::model::Comp::Pong::process_event(const Event* event) {
    cout << "[Pong] Event " << event->_id << " received." << endl;

    switch(current_state){
    case Pong_STATE_s1:
        process_event_in_s1_state(event);
        break;
    case Pong_STATE_s2:
        process_event_in_s2_state(event);
        break;
    }

}

// s1 state

void ::model::Comp::Pong::process_event_in_s1_state(const Event* event){
    cout << "  [State: s1] Processing event" << endl;
    // s1 -e1-> s2 transition
    if(event->_id == Pong_EVENT_ping_s) {
        // no exit action

        // no transition action

        // no entry action
        perform_entry_action_for_s2_state(event);

        // state change
        current_state = Pong_STATE_s2;
        cout << "    State changed to s2" << endl;
    } else
    {
        // event not processed in state
        cout << "    [UNPROCESSED] Event cannot be processed in this state" << endl;
    }
    return;
}




// s2 state

void model::Comp::Pong::perform_entry_action_for_s2_state(const Event* event) {
    cout << "    [Entry: INIT]" << endl;
    /* Original  action code source:
        pi.generateEvent(new PongEvent(false));
    */
    R1_ping->generateEvent(new PongEvent(false));
}

void ::model::Comp::Pong::process_event_in_s2_state(const Event* event){
    cout << "  [State: s2] Processing event" << endl;
    // s2 -e2-> s1 transition
    if(event->_id == Pong_EVENT_ping_s) {
        // no exit action

        // transition action
        perform_actions_on_e2_transition_from_s2_to_s1(event);

        // no entry action

        // state change
        current_state = Pong_STATE_s1;
        cout << "    State changed to s1" << endl;
    } else
    {
        // event not processed in state
        cout << "    [UNPROCESSED] Event cannot be processed in this state" << endl;
    }
    return;
}

void model::Comp::Pong::perform_actions_on_e2_transition_from_s2_to_s1(const Event* event) {
    cout << "    [Action: -> s1]" << endl;
    /* Original  action code source:
        pi.generateEvent(new PongEvent(false));
    */
    R1_ping->generateEvent(new PongEvent(false));
}

model::Comp::Pong::PongEvent::PongEvent(bool isInternal) :
    Event(Ping::Ping_EVENT_pong_s, isInternal){
}
