package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ChildSimpleStateMatch
import com.incquerylabs.emdw.umlintegration.queries.SimpleStateMatch
import com.incquerylabs.emdw.umlintegration.queries.ToplevelSimpleStateMatch
import com.zeligsoft.xtumlrt.common.CompositeState
import com.zeligsoft.xtumlrt.common.SimpleState
import com.zeligsoft.xtumlrt.common.State
import com.zeligsoft.xtumlrt.common.StateMachine
import org.eclipse.incquery.runtime.api.IncQueryEngine

class SimpleStateRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new SimpleStateMapping(engine).specification,
			new ToplevelSimpleStateMapping(engine).specification,
			new ChildSimpleStateMapping(engine).specification
		}
	}
}

class SimpleStateMapping extends AbstractObjectRule<SimpleStateMatch, org.eclipse.uml2.uml.State, SimpleState> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		SimpleState
	}
	
	override getRulePriority() {
		3
	}

	override getQuerySpecification() {
		simpleState
	}

	override getUmlObject(SimpleStateMatch match) {
		match.state
	}

	override createXtumlrtObject(org.eclipse.uml2.uml.State umlObject, SimpleStateMatch match) {
		commonFactory.createSimpleState
	}

	override updateXtumlrtObject(SimpleState xtumlrtObject, SimpleStateMatch match) {
		StateMachineUtil.updateState(xtumlrtObject, match.state)
	}
	
	override insertXtumlrtObject(SimpleState xtumlrtObject, SimpleStateMatch match) {
	}

}


class ToplevelSimpleStateMapping extends AbstractContainmentRule<ToplevelSimpleStateMatch, StateMachine, State> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		4
	}

	override getQuerySpecification() {
		toplevelSimpleState
	}

	override findParent(ToplevelSimpleStateMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.stateMachine).head as StateMachine
	}
	
	override findChild(ToplevelSimpleStateMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.state).head as State
	}
	
	override insertChild(StateMachine parent, State child) {
		parent.top.substates += child
	}

}

class ChildSimpleStateMapping extends AbstractContainmentRule<ChildSimpleStateMatch, CompositeState, State> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		4
	}

	override getQuerySpecification() {
		childSimpleState
	}

	override findParent(ChildSimpleStateMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.parentState).head as CompositeState
	}
	
	override findChild(ChildSimpleStateMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.state).head as State
	}
	
	override insertChild(CompositeState parent, State child) {
		parent.substates += child
	}

}