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

	override getTargetClass() {
		StateMachine
	}
	
	override getRulePriority() {
		2
	}

	override getQuerySpecification() {
		stateMachine
	}

	override getSourceObject(StateMachineMatch match) {
		match.stateMachine
	}

	override createTargetObject(org.eclipse.uml2.uml.StateMachine sourceObject, StateMachineMatch match) {
		targetFactory.createStateMachine => [
			top = targetFactory.createCompositeState
		]
	}

	override updateTargetObject(StateMachine targetObject, StateMachineMatch match) {
	}

	def getTargetContainer(StateMachineMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.behavioredClassifier).filter(Capsule).head
	}

	override insertTargetObject(StateMachine targetObject, StateMachineMatch match) {
		match.targetContainer.behaviour = targetObject
	}
	
}
