package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ChildChoicePointMatch
import com.incquerylabs.emdw.umlintegration.queries.ChoicePointMatch
import com.incquerylabs.emdw.umlintegration.queries.ToplevelChoicePointMatch
import org.eclipse.papyrusrt.xtumlrt.common.ChoicePoint
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.papyrusrt.xtumlrt.common.StateMachine
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Pseudostate

class ChoicePointRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new ChoicePointMapping(engine),
			new ToplevelChoicePointMapping(engine),
			new ChildChoicePointMapping(engine)
		}
	}
}

/**
 * Transforms Pseudostates of choice point kind to ChoicePoints.
 */
class ChoicePointMapping extends AbstractObjectMapping<ChoicePointMatch, Pseudostate, ChoicePoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		ChoicePoint
	}

	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY
	}

	override getQuerySpecification() {
		choicePoint
	}

	override getUmlObject(ChoicePointMatch match) {
		match.pseudostate
	}

	override createXtumlrtObject() {
		commonFactory.createChoicePoint
	}

	override updateXtumlrtObject(ChoicePoint xtumlrtObject, ChoicePointMatch match) {
	}

	override protected insertXtumlrtObject(ChoicePoint xtumlrtObject, ChoicePointMatch match) {
	}
	
}

/**
 * Inserts ChoicePoints to their parent StateMachine.
 */
class ToplevelChoicePointMapping extends AbstractContainmentMapping<ToplevelChoicePointMatch, StateMachine, ChoicePoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(StateMachineMapping.PRIORITY, CommonPriorities.VERTEX_MAPPING_PRIORITY) + 1
	}

	override getQuerySpecification() {
		toplevelChoicePoint
	}

	override findParent(ToplevelChoicePointMatch match) {
		match.stateMachine.findXtumlrtObject(StateMachine)
	}
	
	override findChild(ToplevelChoicePointMatch match) {
		match.pseudostate.findXtumlrtObject(ChoicePoint)
	}
	
	override insertChild(StateMachine parent, ChoicePoint child, ToplevelChoicePointMatch match) {
		parent.top.choicePoints += child
	}

}

/**
 * Inserts ChoicePoints to their parent CompositeState.
 */
class ChildChoicePointMapping extends AbstractContainmentMapping<ChildChoicePointMatch, CompositeState, ChoicePoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY + 1
	}

	override getQuerySpecification() {
		childChoicePoint
	}

	override findParent(ChildChoicePointMatch match) {
		match.state.findXtumlrtObject(CompositeState)
	}
	
	override findChild(ChildChoicePointMatch match) {
		match.pseudostate.findXtumlrtObject(ChoicePoint)
	}
	
	override insertChild(CompositeState parent, ChoicePoint child, ChildChoicePointMatch match) {
		parent.choicePoints += child
	}

}