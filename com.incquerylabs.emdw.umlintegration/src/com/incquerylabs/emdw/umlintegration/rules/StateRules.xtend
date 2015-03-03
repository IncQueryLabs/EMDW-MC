package com.incquerylabs.emdw.umlintegration.rules

import com.zeligsoft.xtumlrt.common.CompositeState
import com.zeligsoft.xtumlrt.common.State
import com.zeligsoft.xtumlrt.common.StateMachine
import com.incquerylabs.emdw.umlintegration.queries.ChildStateMatch
import com.incquerylabs.emdw.umlintegration.queries.ToplevelStateMatch
import com.incquerylabs.emdw.umlintegration.queries.StateMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine

class StateRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new StateMapping(engine).specification,
			new ToplevelStateMapping(engine).specification,
			new ChildStateMapping(engine).specification
		}
	}
}

class StateMapping extends AbstractObjectRule<StateMatch, org.eclipse.uml2.uml.State, State> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		State
	}
	
	override getRulePriority() {
		4
	}

	override getQuerySpecification() {
		state
	}

	override getUmlObject(StateMatch match) {
		match.state
	}

	override createXtumlrtObject(org.eclipse.uml2.uml.State umlObject, StateMatch match) {
		commonFactory.createCompositeState // XXX should be SimpleState if UML state is not composite, but update is problematic
	}

	override updateXtumlrtObject(State xtumlrtObject, StateMatch match) {
	}
	
	override insertXtumlrtObject(State xtumlrtObject, StateMatch match) {
	}

}

class ToplevelStateMapping extends AbstractContainmentRule<ToplevelStateMatch, StateMachine, State> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		5
	}

	override getQuerySpecification() {
		toplevelState
	}

	override findParent(ToplevelStateMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.stateMachine).head as StateMachine
	}
	
	override findChild(ToplevelStateMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.state).head as State
	}
	
	override insertChild(StateMachine parent, State child) {
		parent.top.substates += child
	}

}

class ChildStateMapping extends AbstractContainmentRule<ChildStateMatch, CompositeState, State> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		5
	}

	override getQuerySpecification() {
		childState
	}

	override findParent(ChildStateMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.parentState).head as CompositeState
	}
	
	override findChild(ChildStateMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.state).head as State
	}
	
	override insertChild(CompositeState parent, State child) {
		parent.substates += child
	}

}