package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ChildExitPointMatch
import com.incquerylabs.emdw.umlintegration.queries.ExitPointMatch
import com.incquerylabs.emdw.umlintegration.queries.ToplevelExitPointMatch
import com.zeligsoft.xtumlrt.common.ExitPoint
import com.zeligsoft.xtumlrt.common.State
import com.zeligsoft.xtumlrt.common.StateMachine
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Pseudostate

class ExitPointRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new ExitPointMapping(engine).specification,
			new ToplevelExitPointMapping(engine).specification,
			new ChildExitPointMapping(engine).specification
		}
	}
}

class ExitPointMapping extends AbstractObjectRule<ExitPointMatch, Pseudostate, ExitPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		ExitPoint
	}

	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY
	}

	override getQuerySpecification() {
		exitPoint
	}

	override getUmlObject(ExitPointMatch match) {
		match.pseudostate
	}

	override createXtumlrtObject() {
		commonFactory.createExitPoint
	}

	override updateXtumlrtObject(ExitPoint xtumlrtObject, ExitPointMatch match) {
	}

	override protected insertXtumlrtObject(ExitPoint xtumlrtObject, ExitPointMatch match) {
	}
	
}

class ToplevelExitPointMapping extends AbstractContainmentRule<ToplevelExitPointMatch, StateMachine, ExitPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(StateMachineMapping.PRIORITY, CommonPriorities.VERTEX_MAPPING_PRIORITY) + 1
	}

	override getQuerySpecification() {
		toplevelExitPoint
	}

	override findParent(ToplevelExitPointMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.stateMachine).head as StateMachine
	}
	
	override findChild(ToplevelExitPointMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.pseudostate).head as ExitPoint
	}
	
	override insertChild(StateMachine parent, ExitPoint child) {
		parent.top.exitPoints += child
	}

}

class ChildExitPointMapping extends AbstractContainmentRule<ChildExitPointMatch, State, ExitPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY + 1
	}

	override getQuerySpecification() {
		childExitPoint
	}

	override findParent(ChildExitPointMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.state).head as State
	}
	
	override findChild(ChildExitPointMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.pseudostate).head as ExitPoint
	}
	
	override insertChild(State parent, ExitPoint child) {
		parent.exitPoints += child
	}

}