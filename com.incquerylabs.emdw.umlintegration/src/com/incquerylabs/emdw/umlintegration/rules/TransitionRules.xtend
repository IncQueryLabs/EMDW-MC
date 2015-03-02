package com.incquerylabs.emdw.umlintegration.rules

import com.zeligsoft.xtumlrt.common.StateMachine
import com.zeligsoft.xtumlrt.common.Transition
import com.zeligsoft.xtumlrt.common.Vertex
import com.incquerylabs.emdw.umlintegration.queries.TransitionMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine

class TransitionRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new TransitionMapping(engine).specification
		}
	}
}

class TransitionMapping extends AbstractObjectRule<TransitionMatch, org.eclipse.uml2.uml.Transition, Transition> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getTargetClass() {
		Transition
	}
	
	override getRulePriority() {
		5
	}

	override getQuerySpecification() {
		transition
	}

	override getSourceObject(TransitionMatch match) {
		match.transition
	}

	override createTargetObject(org.eclipse.uml2.uml.Transition sourceObject, TransitionMatch match) {
		targetFactory.createTransition
	}

	override updateTargetObject(Transition targetObject, TransitionMatch match) {
		updateSourceVertex(targetObject, match)
		updateTargetVertex(targetObject, match)
	}

	def updateSourceVertex(Transition targetObject, TransitionMatch match) {
		targetObject.sourceVertex = engine.trace.getAllValuesOfxtumlrtElement(null, null, match.sourceState).head as Vertex
	}

	def updateTargetVertex(Transition targetObject, TransitionMatch match) {
		targetObject.targetVertex = engine.trace.getAllValuesOfxtumlrtElement(null, null, match.targetState).head as Vertex
	}

	def getTargetContainer(TransitionMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.stateMachine).filter(StateMachine).head.top.transitions
	}
	
	override protected insertTargetObject(Transition targetObject, TransitionMatch match) {
		match.targetContainer += targetObject
	}
	
}
