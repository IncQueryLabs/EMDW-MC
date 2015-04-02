package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ChildTransitionMatch
import com.incquerylabs.emdw.umlintegration.queries.ToplevelTransitionMatch
import com.incquerylabs.emdw.umlintegration.queries.TransitionMatch
import com.zeligsoft.xtumlrt.common.CompositeState
import com.zeligsoft.xtumlrt.common.StateMachine
import com.zeligsoft.xtumlrt.common.Transition
import com.zeligsoft.xtumlrt.common.Vertex
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine

class TransitionRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new TransitionMapping(engine),
			new ToplevelTransitionMapping(engine),
			new ChildTransitionMapping(engine)
		}
	}
}

class TransitionMapping extends AbstractObjectMapping<TransitionMatch, org.eclipse.uml2.uml.Transition, Transition> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		Transition
	}
	
	public static val PRIORITY = CommonPriorities.VERTEX_MAPPING_PRIORITY + 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		transition
	}

	override getUmlObject(TransitionMatch match) {
		match.transition
	}

	override createXtumlrtObject() {
		commonFactory.createTransition
	}

	override updateXtumlrtObject(Transition xtumlrtObject, TransitionMatch match) {
		updateSourceVertex(xtumlrtObject, match)
		updateTargetVertex(xtumlrtObject, match)
	}

	def updateSourceVertex(Transition xtumlrtObject, TransitionMatch match) {
		xtumlrtObject.sourceVertex = match.sourceState.findXtumlrtObject(Vertex)
	}

	def updateTargetVertex(Transition xtumlrtObject, TransitionMatch match) {
		xtumlrtObject.targetVertex = match.targetState.findXtumlrtObject(Vertex)
	}

	override protected insertXtumlrtObject(Transition xtumlrtObject, TransitionMatch match) {
	}
	
}

class ToplevelTransitionMapping extends AbstractContainmentMapping<ToplevelTransitionMatch, StateMachine, Transition> {

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
		match.stateMachine.findXtumlrtObject(StateMachine)
	}
	
	override findChild(ToplevelTransitionMatch match) {
		match.transition.findXtumlrtObject(Transition)
	}
	
	override insertChild(StateMachine parent, Transition child) {
		parent.top.transitions += child
	}

}

class ChildTransitionMapping extends AbstractContainmentMapping<ChildTransitionMatch, CompositeState, Transition> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(CommonPriorities.VERTEX_MAPPING_PRIORITY, TransitionMapping.PRIORITY) + 1
	}

	override getQuerySpecification() {
		childTransition
	}

	override findParent(ChildTransitionMatch match) {
		match.parentState.findXtumlrtObject(CompositeState)
	}
	
	override findChild(ChildTransitionMatch match) {
		match.transition.findXtumlrtObject(Transition)
	}
	
	override insertChild(CompositeState parent, Transition child) {
		parent.transitions += child
	}

}