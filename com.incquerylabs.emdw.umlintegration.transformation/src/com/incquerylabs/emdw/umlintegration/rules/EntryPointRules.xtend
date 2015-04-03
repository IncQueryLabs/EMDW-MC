package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ChildEntryPointMatch
import com.incquerylabs.emdw.umlintegration.queries.EntryPointMatch
import com.incquerylabs.emdw.umlintegration.queries.ToplevelEntryPointMatch
import com.zeligsoft.xtumlrt.common.EntryPoint
import com.zeligsoft.xtumlrt.common.State
import com.zeligsoft.xtumlrt.common.StateMachine
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Pseudostate

class EntryPointRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new EntryPointMapping(engine).specification,
			new ToplevelEntryPointMapping(engine).specification,
			new ChildEntryPointMapping(engine).specification
		}
	}
}

class EntryPointMapping extends AbstractObjectRule<EntryPointMatch, Pseudostate, EntryPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		EntryPoint
	}

	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY
	}

	override getQuerySpecification() {
		entryPoint
	}

	override getUmlObject(EntryPointMatch match) {
		match.pseudostate
	}

	override createXtumlrtObject() {
		commonFactory.createEntryPoint
	}

	override updateXtumlrtObject(EntryPoint xtumlrtObject, EntryPointMatch match) {
	}

	override protected insertXtumlrtObject(EntryPoint xtumlrtObject, EntryPointMatch match) {
	}
	
}

class ToplevelEntryPointMapping extends AbstractContainmentRule<ToplevelEntryPointMatch, StateMachine, EntryPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(StateMachineMapping.PRIORITY, CommonPriorities.VERTEX_MAPPING_PRIORITY) + 1
	}

	override getQuerySpecification() {
		toplevelEntryPoint
	}

	override findParent(ToplevelEntryPointMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.stateMachine).head as StateMachine
	}
	
	override findChild(ToplevelEntryPointMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.pseudostate).head as EntryPoint
	}
	
	override insertChild(StateMachine parent, EntryPoint child) {
		parent.top.entryPoints += child
	}

}

class ChildEntryPointMapping extends AbstractContainmentRule<ChildEntryPointMatch, State, EntryPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY + 1
	}

	override getQuerySpecification() {
		childEntryPoint
	}

	override findParent(ChildEntryPointMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.state).head as State
	}
	
	override findChild(ChildEntryPointMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.pseudostate).head as EntryPoint
	}
	
	override insertChild(State parent, EntryPoint child) {
		parent.entryPoints += child
	}

}