package com.incquerylabs.emdw.cpp.codegeneration.templates.runtime

class ActiveComponentTemplates {
	new() {}
	
	def activeComponentHeaderTemplate() '''
	/*
	 * ActiveComponent.h
	 *
	 *  Created on: Jun 24, 2015
	 *      Author: Robert Doczi
	 */
	
	#ifndef SRC_RUNTIME_ACTIVECOMPONENT_H_
	#define SRC_RUNTIME_ACTIVECOMPONENT_H_
	
	#include <list>
	
	class StatefulClass;
	
	/**
	 * A component that has classes with state machine.
	 */
	class ActiveComponent {
	public:
	    virtual ~ActiveComponent() {}
	
	    void schedule(StatefulClass* statefulClass);
	    void process();
	
	private:
	    std::list<StatefulClass*> _statefulClasses;
	};
	
	#endif /* SRC_RUNTIME_ACTIVECOMPONENT_H_ */
	'''
	
	def activeComponentBodyTemplate() '''
	/*
	 * ActiveComponent.cpp
	 *
	 *  Created on: Jun 24, 2015
	 *      Author: Robert Doczi
	 */
	
	#include "ActiveComponent.hh"
	#include "StatefulClass.hh"
	
	void ActiveComponent::schedule(StatefulClass* statefulClass) {
	    _statefulClasses.push_back(statefulClass);
	}
	
	void ActiveComponent::process() {
	    if(!_statefulClasses.empty()) {
	        StatefulClass *sc = _statefulClasses.front();
	        _statefulClasses.pop_front();
	        sc->process();
	    }
	}
	'''
}