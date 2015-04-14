package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ChildDeepHistoryMatch
import com.incquerylabs.emdw.umlintegration.queries.DeepHistoryMatch
import com.incquerylabs.emdw.umlintegration.queries.ToplevelDeepHistoryMatch
import com.zeligsoft.xtumlrt.common.CompositeState
import com.zeligsoft.xtumlrt.common.DeepHistory
import com.zeligsoft.xtumlrt.common.StateMachine
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Pseudostate

class DeepHistoryRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new DeepHistoryMapping(engine),
			new ToplevelDeepHistoryMapping(engine),
			new ChildDeepHistoryMapping(engine)
		}
	}
}

class DeepHistoryMapping extends AbstractObjectMapping<DeepHistoryMatch, Pseudostate, DeepHistory> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		DeepHistory
	}
	
	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY
	}

	override getQuerySpecification() {
		deepHistory
	}

	override getUmlObject(DeepHistoryMatch match) {
		match.pseudostate
	}

	override createXtumlrtObject() {
		commonFactory.createDeepHistory
	}

	override updateXtumlrtObject(DeepHistory xtumlrtObject, DeepHistoryMatch match) {
	}

	override protected insertXtumlrtObject(DeepHistory xtumlrtObject, DeepHistoryMatch match) {
	}
	
}

class ToplevelDeepHistoryMapping extends AbstractContainmentMapping<ToplevelDeepHistoryMatch, StateMachine, DeepHistory> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(StateMachineMapping.PRIORITY, CommonPriorities.VERTEX_MAPPING_PRIORITY) + 1
	}

	override getQuerySpecification() {
		toplevelDeepHistory
	}

	override findParent(ToplevelDeepHistoryMatch match) {
		match.stateMachine.findXtumlrtObject(StateMachine)
	}
	
	override findChild(ToplevelDeepHistoryMatch match) {
		match.pseudostate.findXtumlrtObject(DeepHistory)
	}
	
	override insertChild(StateMachine parent, DeepHistory child) {
		parent.top.deepHistory = child
	}

}

class ChildDeepHistoryMapping extends AbstractContainmentMapping<ChildDeepHistoryMatch, CompositeState, DeepHistory> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY + 1
	}

	override getQuerySpecification() {
		childDeepHistory
	}

	override findParent(ChildDeepHistoryMatch match) {
		match.state.findXtumlrtObject(CompositeState)
	}
	
	override findChild(ChildDeepHistoryMatch match) {
		match.pseudostate.findXtumlrtObject(DeepHistory)
	}
	
	override insertChild(CompositeState parent, DeepHistory child) {
		parent.deepHistory = child
	}

}