package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ChildCompositeStateMatch
import com.incquerylabs.emdw.umlintegration.queries.CompositeStateMatch
import com.incquerylabs.emdw.umlintegration.queries.ToplevelCompositeStateMatch
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.eclipse.papyrusrt.xtumlrt.common.StateMachine
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine

class CompositeStateRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new CompositeStateMapping(engine),
			new ToplevelCompositeStateMapping(engine),
			new ChildCompositeStateMapping(engine)
		}
	}
}

/**
 * Transforms States which have one ore more Regions to CompositeStates.
 * Transformed fields: entryAction, exitAction.
 */
class CompositeStateMapping extends AbstractObjectMapping<CompositeStateMatch, org.eclipse.uml2.uml.State, CompositeState> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		CompositeState
	}
	
	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY
	}

	override getQuerySpecification() {
		compositeState
	}

	override getUmlObject(CompositeStateMatch match) {
		match.state
	}

	override createXtumlrtObject() {
		commonFactory.createCompositeState
	}

	override updateXtumlrtObject(CompositeState xtumlrtObject, CompositeStateMatch match) {
		TransformationUtil.updateState(xtumlrtObject, match.state)
	}
	
	override insertXtumlrtObject(CompositeState xtumlrtObject, CompositeStateMatch match) {
	}

}

/**
 * Inserts CompositeStates to their parent StateMachine.
 */
class ToplevelCompositeStateMapping extends AbstractContainmentMapping<ToplevelCompositeStateMatch, StateMachine, State> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(StateMachineMapping.PRIORITY, CommonPriorities.VERTEX_MAPPING_PRIORITY) + 1
	}

	override getQuerySpecification() {
		toplevelCompositeState
	}

	override findParent(ToplevelCompositeStateMatch match) {
		match.stateMachine.findXtumlrtObject(StateMachine)
	}
	
	override findChild(ToplevelCompositeStateMatch match) {
		match.state.findXtumlrtObject(State)
	}
	
	override insertChild(StateMachine parent, State child) {
		parent.top.substates += child
	}

}

/**
 * Inserts CompositeStates to their parent CompositeState.
 */
class ChildCompositeStateMapping extends AbstractContainmentMapping<ChildCompositeStateMatch, CompositeState, State> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY + 1
	}

	override getQuerySpecification() {
		childCompositeState
	}

	override findParent(ChildCompositeStateMatch match) {
		match.parentState.findXtumlrtObject(CompositeState)
	}
	
	override findChild(ChildCompositeStateMatch match) {
		match.state.findXtumlrtObject(State)
	}
	
	override insertChild(CompositeState parent, State child) {
		parent.substates += child
	}

}