package com.incquerylabs.emdw.umlintegration.rules

import com.zeligsoft.xtumlrt.common.InitialPoint
import com.incquerylabs.emdw.umlintegration.queries.InitialStateMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Pseudostate
import com.zeligsoft.xtumlrt.common.StateMachine
import com.incquerylabs.emdw.umlintegration.queries.ToplevelInitialStateMatch
import com.zeligsoft.xtumlrt.common.CompositeState
import com.incquerylabs.emdw.umlintegration.queries.ChildInitialStateMatch

class InitialStateRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new InitialStateMapping(engine).specification,
			new ToplevelInitialStateMapping(engine).specification,
			new ChildInitialStateMapping(engine).specification
		}
	}
}

class InitialStateMapping extends AbstractObjectRule<InitialStateMatch, Pseudostate, InitialPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getTargetClass() {
		InitialPoint
	}

	override getRulePriority() {
		3
	}

	override getQuerySpecification() {
		initialState
	}

	override getSourceObject(InitialStateMatch match) {
		match.initialState
	}

	override createTargetObject(Pseudostate sourceObject, InitialStateMatch match) {
		targetFactory.createInitialPoint
	}

	override updateTargetObject(InitialPoint targetObject, InitialStateMatch match) {
	}

	override protected insertTargetObject(InitialPoint targetObject, InitialStateMatch match) {
	}
	
}

class ToplevelInitialStateMapping extends AbstractContainmentRule<ToplevelInitialStateMatch, StateMachine, InitialPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		5
	}

	override getQuerySpecification() {
		toplevelInitialState
	}

	override findParent(ToplevelInitialStateMatch match) {
		engine.uml2commonTrace.getAllValuesOfcommonElement(null, null, match.stateMachine).head as StateMachine
	}
	
	override findChild(ToplevelInitialStateMatch match) {
		engine.uml2commonTrace.getAllValuesOfcommonElement(null, null, match.initialState).head as InitialPoint
	}
	
	override insertChild(StateMachine parent, InitialPoint child) {
		parent.top.initial = child
	}

}

class ChildInitialStateMapping extends AbstractContainmentRule<ChildInitialStateMatch, CompositeState, InitialPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		5
	}

	override getQuerySpecification() {
		childInitialState
	}

	override findParent(ChildInitialStateMatch match) {
		engine.uml2commonTrace.getAllValuesOfcommonElement(null, null, match.state).head as CompositeState
	}
	
	override findChild(ChildInitialStateMatch match) {
		engine.uml2commonTrace.getAllValuesOfcommonElement(null, null, match.initialState).head as InitialPoint
	}
	
	override insertChild(CompositeState parent, InitialPoint child) {
		parent.initial = child
	}

}