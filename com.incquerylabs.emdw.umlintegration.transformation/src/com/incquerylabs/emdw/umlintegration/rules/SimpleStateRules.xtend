package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ChildSimpleStateMatch
import com.incquerylabs.emdw.umlintegration.queries.SimpleStateMatch
import com.incquerylabs.emdw.umlintegration.queries.ToplevelSimpleStateMatch
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil
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
		CommonPriorities.VERTEX_MAPPING_PRIORITY
	}

	override getQuerySpecification() {
		simpleState
	}

	override getUmlObject(SimpleStateMatch match) {
		match.state
	}

	override createXtumlrtObject() {
		commonFactory.createSimpleState
	}

	override updateXtumlrtObject(SimpleState xtumlrtObject, SimpleStateMatch match) {
		TransformationUtil.updateState(xtumlrtObject, match.state)
	}
	
	override insertXtumlrtObject(SimpleState xtumlrtObject, SimpleStateMatch match) {
	}

}


class ToplevelSimpleStateMapping extends AbstractContainmentRule<ToplevelSimpleStateMatch, StateMachine, State> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(StateMachineMapping.PRIORITY, CommonPriorities.VERTEX_MAPPING_PRIORITY) + 1
	}

	override getQuerySpecification() {
		toplevelSimpleState
	}

	override findParent(ToplevelSimpleStateMatch match) {
		match.stateMachine.findXtumlrtObject(StateMachine)
	}
	
	override findChild(ToplevelSimpleStateMatch match) {
		match.state.findXtumlrtObject(State)
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
		CommonPriorities.VERTEX_MAPPING_PRIORITY + 1
	}

	override getQuerySpecification() {
		childSimpleState
	}

	override findParent(ChildSimpleStateMatch match) {
		match.parentState.findXtumlrtObject(CompositeState)
	}
	
	override findChild(ChildSimpleStateMatch match) {
		match.state.findXtumlrtObject(State)
	}
	
	override insertChild(CompositeState parent, State child) {
		parent.substates += child
	}

}