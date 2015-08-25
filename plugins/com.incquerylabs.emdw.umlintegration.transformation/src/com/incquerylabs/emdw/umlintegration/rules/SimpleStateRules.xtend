package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ChildSimpleStateMatch
import com.incquerylabs.emdw.umlintegration.queries.SimpleStateMatch
import com.incquerylabs.emdw.umlintegration.queries.ToplevelSimpleStateMatch
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.papyrusrt.xtumlrt.common.SimpleState
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.eclipse.papyrusrt.xtumlrt.common.StateMachine
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine

class SimpleStateRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new SimpleStateMapping(engine),
			new ToplevelSimpleStateMapping(engine),
			new ChildSimpleStateMapping(engine)
		}
	}
}

/**
 * Transforms States which have no Regions to SimpleStates.
 * Transformed fields: entryAction, exitAction.
 */
class SimpleStateMapping extends AbstractObjectMapping<SimpleStateMatch, org.eclipse.uml2.uml.State, SimpleState> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		SimpleState
	}
	
	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY
	}

	override getQuerySpecification() {
		simpleState
	}

	override getUmlObject(SimpleStateMatch match) {
		match.state
	}

	override createXtumlrtObject() {
		commonFactory.createSimpleState
	}

	override updateXtumlrtObject(SimpleState xtumlrtObject, SimpleStateMatch match) {
	}
	
	override insertXtumlrtObject(SimpleState xtumlrtObject, SimpleStateMatch match) {
	}

}

/**
 * Inserts SimpleStates to their parent StateMachine.
 */
class ToplevelSimpleStateMapping extends AbstractContainmentMapping<ToplevelSimpleStateMatch, StateMachine, State> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(StateMachineMapping.PRIORITY, CommonPriorities.VERTEX_MAPPING_PRIORITY) + 1
	}

	override getQuerySpecification() {
		toplevelSimpleState
	}

	override findParent(ToplevelSimpleStateMatch match) {
		match.stateMachine.findXtumlrtObject(StateMachine)
	}
	
	override findChild(ToplevelSimpleStateMatch match) {
		match.state.findXtumlrtObject(State)
	}
	
	override insertChild(StateMachine parent, State child, ToplevelSimpleStateMatch match) {
		parent.top.substates += child
	}

}

/**
 * Inserts SimpleStates to their parent CompositeState.
 */
class ChildSimpleStateMapping extends AbstractContainmentMapping<ChildSimpleStateMatch, CompositeState, State> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY + 1
	}

	override getQuerySpecification() {
		childSimpleState
	}

	override findParent(ChildSimpleStateMatch match) {
		match.parentState.findXtumlrtObject(CompositeState)
	}
	
	override findChild(ChildSimpleStateMatch match) {
		match.state.findXtumlrtObject(State)
	}
	
	override insertChild(CompositeState parent, State child, ChildSimpleStateMatch match) {
		parent.substates += child
	}

}