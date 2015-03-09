package com.incquerylabs.emdw.umlintegration.rules

import com.zeligsoft.xtumlrt.common.InitialPoint
import com.incquerylabs.emdw.umlintegration.queries.InitialPointMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Pseudostate
import com.zeligsoft.xtumlrt.common.StateMachine
import com.incquerylabs.emdw.umlintegration.queries.ToplevelInitialPointMatch
import com.zeligsoft.xtumlrt.common.CompositeState
import com.incquerylabs.emdw.umlintegration.queries.ChildInitialPointMatch

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
		StateMachineUtil.VERTEX_MAPPING_PRIORITY
	}

	override getQuerySpecification() {
		initialPoint
	}

	override getUmlObject(InitialPointMatch match) {
		match.pseudostate
	}

	override createXtumlrtObject(Pseudostate umlObject, InitialPointMatch match) {
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
		Math.max(StateMachineMapping.PRIORITY, StateMachineUtil.VERTEX_MAPPING_PRIORITY) + 1
	}

	override getQuerySpecification() {
		toplevelInitialPoint
	}

	override findParent(ToplevelInitialPointMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.stateMachine).head as StateMachine
	}
	
	override findChild(ToplevelInitialPointMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.pseudostate).head as InitialPoint
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
		StateMachineUtil.VERTEX_MAPPING_PRIORITY + 1
	}

	override getQuerySpecification() {
		childInitialPoint
	}

	override findParent(ChildInitialPointMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.state).head as CompositeState
	}
	
	override findChild(ChildInitialPointMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.pseudostate).head as InitialPoint
	}
	
	override insertChild(CompositeState parent, InitialPoint child) {
		parent.initial = child
	}

}