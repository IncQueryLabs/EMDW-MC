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
	
	override getXtumlrtClass() {
		Transition
	}
	
	override getRulePriority() {
		5
	}

	override getQuerySpecification() {
		transition
	}

	override getUmlObject(TransitionMatch match) {
		match.transition
	}

	override createXtumlrtObject(org.eclipse.uml2.uml.Transition umlObject, TransitionMatch match) {
		commonFactory.createTransition
	}

	override updateXtumlrtObject(Transition xtumlrtObject, TransitionMatch match) {
		updateSourceVertex(xtumlrtObject, match)
		updateTargetVertex(xtumlrtObject, match)
	}

	def updateSourceVertex(Transition xtumlrtObject, TransitionMatch match) {
		xtumlrtObject.sourceVertex = engine.trace.getAllValuesOfxtumlrtElement(null, null, match.sourceState).head as Vertex
	}

	def updateTargetVertex(Transition xtumlrtObject, TransitionMatch match) {
		xtumlrtObject.targetVertex = engine.trace.getAllValuesOfxtumlrtElement(null, null, match.targetState).head as Vertex
	}

	def getXtumlrtContainer(TransitionMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.stateMachine).filter(StateMachine).head.top.transitions
	}
	
	override protected insertXtumlrtObject(Transition xtumlrtObject, TransitionMatch match) {
		match.xtumlrtContainer += xtumlrtObject
	}
	
}
