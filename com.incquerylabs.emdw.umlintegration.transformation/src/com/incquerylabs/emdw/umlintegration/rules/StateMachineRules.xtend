package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.StateMachineMatch
import com.zeligsoft.xtumlrt.common.StateMachine
import com.zeligsoft.xtumlrt.xtuml.XTClass
import org.eclipse.incquery.runtime.api.IncQueryEngine

class StateMachineRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new StateMachineMapping(engine).specification
		}
	}
}

class StateMachineMapping extends AbstractObjectRule<StateMachineMatch, org.eclipse.uml2.uml.StateMachine, StateMachine> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		StateMachine
	}
	
	public static val PRIORITY = XTClassMapping.PRIORITY + 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		stateMachine
	}

	override getUmlObject(StateMachineMatch match) {
		match.stateMachine
	}

	override createXtumlrtObject() {
		commonFactory.createStateMachine => [
			top = commonFactory.createCompositeState
		]
	}

	override updateXtumlrtObject(StateMachine xtumlrtObject, StateMachineMatch match) {
	}

	def getXtumlrtContainer(StateMachineMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.behavioredClassifier).head as XTClass
	}

	override insertXtumlrtObject(StateMachine xtumlrtObject, StateMachineMatch match) {
		match.xtumlrtContainer.behaviour = xtumlrtObject
	}
	
}
