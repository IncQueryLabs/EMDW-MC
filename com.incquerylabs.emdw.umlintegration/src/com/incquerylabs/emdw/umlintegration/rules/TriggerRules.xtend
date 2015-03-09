package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.TriggerMatch
import com.zeligsoft.xtumlrt.common.Transition
import com.zeligsoft.xtumlrt.common.Trigger
import org.eclipse.incquery.runtime.api.IncQueryEngine

class TriggerRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new TriggerMapping(engine).specification
		}
	}
}

class TriggerMapping extends AbstractObjectRule<TriggerMatch, org.eclipse.uml2.uml.Trigger, Trigger> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		Trigger
	}
	
	override getRulePriority() {
		TransitionMapping.PRIORITY + 1
	}

	override getQuerySpecification() {
		trigger
	}

	override getUmlObject(TriggerMatch match) {
		match.trigger
	}

	override createXtumlrtObject(org.eclipse.uml2.uml.Trigger umlObject, TriggerMatch match) {
		commonFactory.createTrigger
	}

	override updateXtumlrtObject(Trigger xtumlrtObject, TriggerMatch match) {
	}

	def getXtumlrtContainer(TriggerMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.transition).head as Transition
	}

	override insertXtumlrtObject(Trigger xtumlrtObject, TriggerMatch match) {
		match.xtumlrtContainer.triggers += xtumlrtObject
	}
	
}
