package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtEventTriggerMatch
import com.zeligsoft.xtumlrt.common.Transition
import com.zeligsoft.xtumlrt.xtuml.XTEventTrigger
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Trigger
import org.eclipse.uml2.uml.SignalEvent
import com.zeligsoft.xtumlrt.xtuml.XTSignalEvent

class XTEventTriggerRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new XTEventTriggerMapping(engine).specification
		}
	}
}

class XTEventTriggerMapping extends AbstractObjectRule<XtEventTriggerMatch, Trigger, XTEventTrigger> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		XTEventTrigger
	}

	public static val PRIORITY = Math.max(TransitionMapping.PRIORITY + 1, XTSignalEventMapping.PRIORITY + 1)
	
	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		xtEventTrigger
	}

	override getUmlObject(XtEventTriggerMatch match) {
		match.trigger
	}

	override createXtumlrtObject(Trigger umlObject, XtEventTriggerMatch match) {
		xtumlFactory.createXTEventTrigger
	}

	override updateXtumlrtObject(XTEventTrigger xtumlrtObject, XtEventTriggerMatch match) {
		switch event : match.trigger.event {
			SignalEvent: {
				xtumlrtObject.signal = engine.trace.getAllValuesOfxtumlrtElement(null, null, event.signal).head as XTSignalEvent
			} 
		}
	}

	def getXtumlrtContainer(XtEventTriggerMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.transition).head as Transition
	}

	override insertXtumlrtObject(XTEventTrigger xtumlrtObject, XtEventTriggerMatch match) {
		match.xtumlrtContainer.triggers += xtumlrtObject
	}
	
}
