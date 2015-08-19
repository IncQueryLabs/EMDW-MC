package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPTransition
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Transition
import org.eclipse.papyrusrt.xtumlrt.common.Trigger
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEventTrigger

class TransitionTemplates extends CPPTemplate {
	val ActionCodeTemplates actionCodeTemplates
	
	new(IncQueryEngine engine) {
		super(engine)
		actionCodeTemplates = new ActionCodeTemplates(engine)
	}
	
	def generatedTransitionCondition(CPPTransition cppTransition, String cppClassName, String stateCppName, String target) {
		val transition = cppTransition.commonTransition
		var condition = transition.generateEventMatchingCondition(cppClassName)
		val guardCall = '''evaluate_guard_on_«cppTransition.cppName»_transition_from_«stateCppName»_to_«target»(event_id, event_content)'''
		if(condition.length > 0 && transition.guard != null){
			condition = condition + " && "
		}
		if(transition.guard != null){
			condition = condition + guardCall
		}
		condition
	}
	
	def generateEventMatchingCondition(Transition transition, String cppClassName) {
		val triggers = transition.triggers
		if(triggers.empty) {
			''''''
		} else if(triggers.size == 1){
			'''event_id == «cppClassName»_EVENT_«triggers.head.getEventId»'''
		} else {
			'''
			(«FOR trigger : triggers SEPARATOR " || "»event_id == «trigger.getEventId»«ENDFOR»)'''
		}
	}
	
	def getEventId(Trigger trigger) {
		val cppEventMatcher = codeGenQueries.getCppEvents(engine)
		val xttrigger = trigger as XTEventTrigger
		val cppEvent = cppEventMatcher.getAllValuesOfcppEvent(xttrigger.signal).head
		cppEvent.cppName
	}
}
