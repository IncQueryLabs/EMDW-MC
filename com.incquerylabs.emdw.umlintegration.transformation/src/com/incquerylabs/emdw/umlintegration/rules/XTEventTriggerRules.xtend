package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtEventTriggerMatch
import com.zeligsoft.xtumlrt.common.Transition
import com.zeligsoft.xtumlrt.xtuml.XTEventTrigger
import com.zeligsoft.xtumlrt.xtuml.XTSignalEvent
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.SignalEvent
import org.eclipse.uml2.uml.Trigger

class XTEventTriggerRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new XTEventTriggerMapping(engine)
		}
	}
}

class XTEventTriggerMapping extends AbstractObjectMapping<XtEventTriggerMatch, Trigger, XTEventTrigger> {

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

	override createXtumlrtObject() {
		xtumlFactory.createXTEventTrigger
	}

	override updateXtumlrtObject(XTEventTrigger xtumlrtObject, XtEventTriggerMatch match) {
		switch event : match.trigger.event {
			SignalEvent: {
				xtumlrtObject.signal = event.signal.findXtumlrtObject(XTSignalEvent)
			} 
		}
	}

	def getXtumlrtContainer(XtEventTriggerMatch match) {
		match.transition.findXtumlrtObject(Transition)
	}

	override insertXtumlrtObject(XTEventTrigger xtumlrtObject, XtEventTriggerMatch match) {
		match.xtumlrtContainer.triggers += xtumlrtObject
	}
	
}
