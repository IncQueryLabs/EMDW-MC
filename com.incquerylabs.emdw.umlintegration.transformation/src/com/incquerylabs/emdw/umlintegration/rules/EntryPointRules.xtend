package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ChildEntryPointMatch
import com.incquerylabs.emdw.umlintegration.queries.EntryPointMatch
import com.incquerylabs.emdw.umlintegration.queries.ToplevelEntryPointMatch
import com.zeligsoft.xtumlrt.common.EntryPoint
import com.zeligsoft.xtumlrt.common.State
import com.zeligsoft.xtumlrt.common.StateMachine
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Pseudostate

class EntryPointRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new EntryPointMapping(engine),
			new ToplevelEntryPointMapping(engine),
			new ChildEntryPointMapping(engine)
		}
	}
}

/**
 * Transforms Pseudostates of entry point kind to EntryPoints.
 */
class EntryPointMapping extends AbstractObjectMapping<EntryPointMatch, Pseudostate, EntryPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		EntryPoint
	}

	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY
	}

	override getQuerySpecification() {
		entryPoint
	}

	override getUmlObject(EntryPointMatch match) {
		match.pseudostate
	}

	override createXtumlrtObject() {
		commonFactory.createEntryPoint
	}

	override updateXtumlrtObject(EntryPoint xtumlrtObject, EntryPointMatch match) {
	}

	override protected insertXtumlrtObject(EntryPoint xtumlrtObject, EntryPointMatch match) {
	}
	
}

/**
 * Inserts EntryPoints to their parent StateMachine.
 */
class ToplevelEntryPointMapping extends AbstractContainmentMapping<ToplevelEntryPointMatch, StateMachine, EntryPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(StateMachineMapping.PRIORITY, CommonPriorities.VERTEX_MAPPING_PRIORITY) + 1
	}

	override getQuerySpecification() {
		toplevelEntryPoint
	}

	override findParent(ToplevelEntryPointMatch match) {
		match.stateMachine.findXtumlrtObject(StateMachine)
	}
	
	override findChild(ToplevelEntryPointMatch match) {
		match.pseudostate.findXtumlrtObject(EntryPoint)
	}
	
	override insertChild(StateMachine parent, EntryPoint child) {
		parent.top.entryPoints += child
	}

}

/**
 * Inserts EntryPoints to their parent CompositeState.
 */
class ChildEntryPointMapping extends AbstractContainmentMapping<ChildEntryPointMatch, State, EntryPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY + 1
	}

	override getQuerySpecification() {
		childEntryPoint
	}

	override findParent(ChildEntryPointMatch match) {
		match.state.findXtumlrtObject(State)
	}
	
	override findChild(ChildEntryPointMatch match) {
		match.pseudostate.findXtumlrtObject(EntryPoint)
	}
	
	override insertChild(State parent, EntryPoint child) {
		parent.entryPoints += child
	}

}