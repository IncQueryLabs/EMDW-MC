package com.incquerylabs.emdw.cpp.codegeneration.templates.runtime

class EventTemplates {
	new() {}
	
	def eventHeaderTemplate() '''
	/*
	 * Event.h
	 *
	 *  Created on: Jun 23, 2015
	 *      Author: Robert Doczi
	 */
	
	#ifndef SRC_RUNTIME_EVENT_H_
	#define SRC_RUNTIME_EVENT_H_
	
	class Event {
	public:
	    Event(int id, bool isInternal) :
	        _id(id), _isInternal(isInternal) {
	    }
	
	    virtual ~Event() {}
	
	    int _id;
	    bool _isInternal;
	private:
	    Event(const Event&);
	    Event& operator=(const Event&);
	};
	
	#endif /* SRC_RUNTIME_EVENT_H_ */
	'''
}