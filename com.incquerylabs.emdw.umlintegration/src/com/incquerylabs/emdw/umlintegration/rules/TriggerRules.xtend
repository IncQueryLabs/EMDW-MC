package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.TriggerMatch
import com.zeligsoft.xtumlrt.common.Transition
import com.zeligsoft.xtumlrt.xtuml.XTEventTrigger
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Trigger

class TriggerRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new TriggerMapping(engine).specification
		}
	}
}

class TriggerMapping extends AbstractObjectRule<TriggerMatch, Trigger, XTEventTrigger> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		XTEventTrigger
	}

	public static val PRIORITY = TransitionMapping.PRIORITY + 1
	
	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		trigger
	}

	override getUmlObject(TriggerMatch match) {
		match.trigger
	}

	override createXtumlrtObject(Trigger umlObject, TriggerMatch match) {
		xtumlFactory.createXTEventTrigger
	}

	override updateXtumlrtObject(XTEventTrigger xtumlrtObject, TriggerMatch match) {
	}

	def getXtumlrtContainer(TriggerMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.transition).head as Transition
	}

	override insertXtumlrtObject(XTEventTrigger xtumlrtObject, TriggerMatch match) {
		match.xtumlrtContainer.triggers += xtumlrtObject
	}
	
}
