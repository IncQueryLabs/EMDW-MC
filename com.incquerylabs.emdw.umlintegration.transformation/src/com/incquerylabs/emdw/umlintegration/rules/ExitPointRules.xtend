package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ChildExitPointMatch
import com.incquerylabs.emdw.umlintegration.queries.ExitPointMatch
import com.incquerylabs.emdw.umlintegration.queries.ToplevelExitPointMatch
import com.zeligsoft.xtumlrt.common.ExitPoint
import com.zeligsoft.xtumlrt.common.State
import com.zeligsoft.xtumlrt.common.StateMachine
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Pseudostate

class ExitPointRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new ExitPointMapping(engine),
			new ToplevelExitPointMapping(engine),
			new ChildExitPointMapping(engine)
		}
	}
}

/**
 * Transforms Pseudostates of exit point kind to ExitPoints.
 */
class ExitPointMapping extends AbstractObjectMapping<ExitPointMatch, Pseudostate, ExitPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		ExitPoint
	}

	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY
	}

	override getQuerySpecification() {
		exitPoint
	}

	override getUmlObject(ExitPointMatch match) {
		match.pseudostate
	}

	override createXtumlrtObject() {
		commonFactory.createExitPoint
	}

	override updateXtumlrtObject(ExitPoint xtumlrtObject, ExitPointMatch match) {
	}

	override protected insertXtumlrtObject(ExitPoint xtumlrtObject, ExitPointMatch match) {
	}
	
}

/**
 * Inserts ExitPoints to their parent StateMachine.
 */
class ToplevelExitPointMapping extends AbstractContainmentMapping<ToplevelExitPointMatch, StateMachine, ExitPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(StateMachineMapping.PRIORITY, CommonPriorities.VERTEX_MAPPING_PRIORITY) + 1
	}

	override getQuerySpecification() {
		toplevelExitPoint
	}

	override findParent(ToplevelExitPointMatch match) {
		match.stateMachine.findXtumlrtObject(StateMachine)
	}
	
	override findChild(ToplevelExitPointMatch match) {
		match.pseudostate.findXtumlrtObject(ExitPoint)
	}
	
	override insertChild(StateMachine parent, ExitPoint child) {
		parent.top.exitPoints += child
	}

}

/**
 * Inserts ExitPoints to their parent CompositeState.
 */
class ChildExitPointMapping extends AbstractContainmentMapping<ChildExitPointMatch, State, ExitPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY + 1
	}

	override getQuerySpecification() {
		childExitPoint
	}

	override findParent(ChildExitPointMatch match) {
		match.state.findXtumlrtObject(State)
	}
	
	override findChild(ChildExitPointMatch match) {
		match.pseudostate.findXtumlrtObject(ExitPoint)
	}
	
	override insertChild(State parent, ExitPoint child) {
		parent.exitPoints += child
	}

}