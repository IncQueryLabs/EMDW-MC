package com.incquerylabs.emdw.cpp.codegeneration.templates

import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Trigger
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEventTrigger

class TransitionTemplates extends CPPTemplate {
	val ActionCodeTemplates actionCodeTemplates
	
	new(IncQueryEngine engine) {
		super(engine)
		actionCodeTemplates = new ActionCodeTemplates(engine)
	}
	
	def getEventId(Trigger trigger) {
		val cppEventMatcher = codeGenQueries.getCppEvents(engine)
		val xttrigger = trigger as XTEventTrigger
		val cppEvent = cppEventMatcher.getAllValuesOfcppEvent(xttrigger.signal).head
		cppEvent.cppName
	}
}
