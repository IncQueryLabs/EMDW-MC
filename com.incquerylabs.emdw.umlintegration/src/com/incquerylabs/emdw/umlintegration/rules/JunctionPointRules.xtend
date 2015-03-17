package com.incquerylabs.emdw.umlintegration.rules

import com.zeligsoft.xtumlrt.common.JunctionPoint
import com.incquerylabs.emdw.umlintegration.queries.JunctionPointMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Pseudostate
import com.zeligsoft.xtumlrt.common.StateMachine
import com.incquerylabs.emdw.umlintegration.queries.ToplevelJunctionPointMatch
import com.zeligsoft.xtumlrt.common.CompositeState
import com.incquerylabs.emdw.umlintegration.queries.ChildJunctionPointMatch

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
		TransformationUtil.VERTEX_MAPPING_PRIORITY
	}

	override getQuerySpecification() {
		junctionPoint
	}

	override getUmlObject(JunctionPointMatch match) {
		match.pseudostate
	}

	override createXtumlrtObject(Pseudostate umlObject, JunctionPointMatch match) {
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
		Math.max(StateMachineMapping.PRIORITY, TransformationUtil.VERTEX_MAPPING_PRIORITY) + 1
	}

	override getQuerySpecification() {
		toplevelJunctionPoint
	}

	override findParent(ToplevelJunctionPointMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.stateMachine).head as StateMachine
	}
	
	override findChild(ToplevelJunctionPointMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.pseudostate).head as JunctionPoint
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
		TransformationUtil.VERTEX_MAPPING_PRIORITY + 1
	}

	override getQuerySpecification() {
		childJunctionPoint
	}

	override findParent(ChildJunctionPointMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.state).head as CompositeState
	}
	
	override findChild(ChildJunctionPointMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.pseudostate).head as JunctionPoint
	}
	
	override insertChild(CompositeState parent, JunctionPoint child) {
		parent.junctionPoints += child
	}

}