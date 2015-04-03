package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ChildJunctionPointMatch
import com.incquerylabs.emdw.umlintegration.queries.JunctionPointMatch
import com.incquerylabs.emdw.umlintegration.queries.ToplevelJunctionPointMatch
import com.zeligsoft.xtumlrt.common.CompositeState
import com.zeligsoft.xtumlrt.common.JunctionPoint
import com.zeligsoft.xtumlrt.common.StateMachine
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Pseudostate

class JunctionPointRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new JunctionPointMapping(engine).specification,
			new ToplevelJunctionPointMapping(engine).specification,
			new ChildJunctionPointMapping(engine).specification
		}
	}
}

class JunctionPointMapping extends AbstractObjectRule<JunctionPointMatch, Pseudostate, JunctionPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		JunctionPoint
	}

	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY
	}

	override getQuerySpecification() {
		junctionPoint
	}

	override getUmlObject(JunctionPointMatch match) {
		match.pseudostate
	}

	override createXtumlrtObject() {
		commonFactory.createJunctionPoint
	}

	override updateXtumlrtObject(JunctionPoint xtumlrtObject, JunctionPointMatch match) {
	}

	override protected insertXtumlrtObject(JunctionPoint xtumlrtObject, JunctionPointMatch match) {
	}
	
}

class ToplevelJunctionPointMapping extends AbstractContainmentRule<ToplevelJunctionPointMatch, StateMachine, JunctionPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(StateMachineMapping.PRIORITY, CommonPriorities.VERTEX_MAPPING_PRIORITY) + 1
	}

	override getQuerySpecification() {
		toplevelJunctionPoint
	}

	override findParent(ToplevelJunctionPointMatch match) {
		match.stateMachine.findXtumlrtObject(StateMachine)
	}
	
	override findChild(ToplevelJunctionPointMatch match) {
		match.pseudostate.findXtumlrtObject(JunctionPoint)
	}
	
	override insertChild(StateMachine parent, JunctionPoint child) {
		parent.top.junctionPoints += child
	}

}

class ChildJunctionPointMapping extends AbstractContainmentRule<ChildJunctionPointMatch, CompositeState, JunctionPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY + 1
	}

	override getQuerySpecification() {
		childJunctionPoint
	}

	override findParent(ChildJunctionPointMatch match) {
		match.state.findXtumlrtObject(CompositeState)
	}
	
	override findChild(ChildJunctionPointMatch match) {
		match.pseudostate.findXtumlrtObject(JunctionPoint)
	}
	
	override insertChild(CompositeState parent, JunctionPoint child) {
		parent.junctionPoints += child
	}

}