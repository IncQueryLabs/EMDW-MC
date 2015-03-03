package com.incquerylabs.emdw.umlintegration.rules

import com.zeligsoft.xtumlrt.common.Capsule
import com.zeligsoft.xtumlrt.common.StateMachine
import com.incquerylabs.emdw.umlintegration.queries.StateMachineMatch
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
	
	override getRulePriority() {
		2
	}

	override getQuerySpecification() {
		stateMachine
	}

	override getUmlObject(StateMachineMatch match) {
		match.stateMachine
	}

	override createXtumlrtObject(org.eclipse.uml2.uml.StateMachine umlObject, StateMachineMatch match) {
		commonFactory.createStateMachine => [
			top = commonFactory.createCompositeState
		]
	}

	override updateXtumlrtObject(StateMachine xtumlrtObject, StateMachineMatch match) {
	}

	def getXtumlrtContainer(StateMachineMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.behavioredClassifier).filter(Capsule).head
	}

	override insertXtumlrtObject(StateMachine xtumlrtObject, StateMachineMatch match) {
		match.xtumlrtContainer.behaviour = xtumlrtObject
	}
	
}
