package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.TransitionMatch
import com.zeligsoft.xtumlrt.common.Transition
import com.zeligsoft.xtumlrt.common.Vertex
import org.eclipse.incquery.runtime.api.IncQueryEngine
import com.incquerylabs.emdw.umlintegration.queries.ToplevelTransitionMatch
import com.zeligsoft.xtumlrt.common.StateMachine
import com.incquerylabs.emdw.umlintegration.queries.ChildTransitionMatch
import com.zeligsoft.xtumlrt.common.CompositeState

class TransitionRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new TransitionMapping(engine).specification,
			new ToplevelTransitionMapping(engine).specification,
			new ChildTransitionMapping(engine).specification
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
	
	public static val PRIORITY = StateMachineUtil.VERTEX_MAPPING_PRIORITY + 1

	override getRulePriority() {
		PRIORITY
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

	override protected insertXtumlrtObject(Transition xtumlrtObject, TransitionMatch match) {
	}
	
}

class ToplevelTransitionMapping extends AbstractContainmentRule<ToplevelTransitionMatch, StateMachine, Transition> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(StateMachineMapping.PRIORITY, TransitionMapping.PRIORITY) + 1
	}

	override getQuerySpecification() {
		toplevelTransition
	}

	override findParent(ToplevelTransitionMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.stateMachine).head as StateMachine
	}
	
	override findChild(ToplevelTransitionMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.transition).head as Transition
	}
	
	override insertChild(StateMachine parent, Transition child) {
		parent.top.transitions += child
	}

}

class ChildTransitionMapping extends AbstractContainmentRule<ChildTransitionMatch, CompositeState, Transition> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(StateMachineUtil.VERTEX_MAPPING_PRIORITY, TransitionMapping.PRIORITY) + 1
	}

	override getQuerySpecification() {
		childTransition
	}

	override findParent(ChildTransitionMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.parentState).head as CompositeState
	}
	
	override findChild(ChildTransitionMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.transition).head as Transition
	}
	
	override insertChild(CompositeState parent, Transition child) {
		parent.transitions += child
	}

}