package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ChildInitialPointMatch
import com.incquerylabs.emdw.umlintegration.queries.InitialPointMatch
import com.incquerylabs.emdw.umlintegration.queries.ToplevelInitialPointMatch
import com.zeligsoft.xtumlrt.common.CompositeState
import com.zeligsoft.xtumlrt.common.InitialPoint
import com.zeligsoft.xtumlrt.common.StateMachine
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Pseudostate

class InitialPointRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new InitialPointMapping(engine).specification,
			new ToplevelInitialPointMapping(engine).specification,
			new ChildInitialPointMapping(engine).specification
		}
	}
}

class InitialPointMapping extends AbstractObjectRule<InitialPointMatch, Pseudostate, InitialPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		InitialPoint
	}

	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY
	}

	override getQuerySpecification() {
		initialPoint
	}

	override getUmlObject(InitialPointMatch match) {
		match.pseudostate
	}

	override createXtumlrtObject() {
		commonFactory.createInitialPoint
	}

	override updateXtumlrtObject(InitialPoint xtumlrtObject, InitialPointMatch match) {
	}

	override protected insertXtumlrtObject(InitialPoint xtumlrtObject, InitialPointMatch match) {
	}
	
}

class ToplevelInitialPointMapping extends AbstractContainmentRule<ToplevelInitialPointMatch, StateMachine, InitialPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(StateMachineMapping.PRIORITY, CommonPriorities.VERTEX_MAPPING_PRIORITY) + 1
	}

	override getQuerySpecification() {
		toplevelInitialPoint
	}

	override findParent(ToplevelInitialPointMatch match) {
		match.stateMachine.findXtumlrtObject(StateMachine)
	}
	
	override findChild(ToplevelInitialPointMatch match) {
		match.pseudostate.findXtumlrtObject(InitialPoint)
	}
	
	override insertChild(StateMachine parent, InitialPoint child) {
		parent.top.initial = child
	}

}

class ChildInitialPointMapping extends AbstractContainmentRule<ChildInitialPointMatch, CompositeState, InitialPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY + 1
	}

	override getQuerySpecification() {
		childInitialPoint
	}

	override findParent(ChildInitialPointMatch match) {
		match.state.findXtumlrtObject(CompositeState)
	}
	
	override findChild(ChildInitialPointMatch match) {
		match.pseudostate.findXtumlrtObject(InitialPoint)
	}
	
	override insertChild(CompositeState parent, InitialPoint child) {
		parent.initial = child
	}

}