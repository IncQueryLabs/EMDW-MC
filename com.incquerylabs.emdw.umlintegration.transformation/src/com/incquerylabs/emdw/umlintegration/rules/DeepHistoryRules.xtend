package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ChildDeepHistoryMatch
import com.incquerylabs.emdw.umlintegration.queries.DeepHistoryMatch
import com.incquerylabs.emdw.umlintegration.queries.ToplevelDeepHistoryMatch
import com.zeligsoft.xtumlrt.common.CompositeState
import com.zeligsoft.xtumlrt.common.DeepHistory
import com.zeligsoft.xtumlrt.common.StateMachine
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Pseudostate

class DeepHistoryRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new DeepHistoryMapping(engine).specification,
			new ToplevelDeepHistoryMapping(engine).specification,
			new ChildDeepHistoryMapping(engine).specification
		}
	}
}

class DeepHistoryMapping extends AbstractObjectRule<DeepHistoryMatch, Pseudostate, DeepHistory> {

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

class ToplevelDeepHistoryMapping extends AbstractContainmentRule<ToplevelDeepHistoryMatch, StateMachine, DeepHistory> {

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
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.stateMachine).head as StateMachine
	}
	
	override findChild(ToplevelDeepHistoryMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.pseudostate).head as DeepHistory
	}
	
	override insertChild(StateMachine parent, DeepHistory child) {
		parent.top.deepHistory = child
	}

}

class ChildDeepHistoryMapping extends AbstractContainmentRule<ChildDeepHistoryMatch, CompositeState, DeepHistory> {

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
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.state).head as CompositeState
	}
	
	override findChild(ChildDeepHistoryMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.pseudostate).head as DeepHistory
	}
	
	override insertChild(CompositeState parent, DeepHistory child) {
		parent.deepHistory = child
	}

}