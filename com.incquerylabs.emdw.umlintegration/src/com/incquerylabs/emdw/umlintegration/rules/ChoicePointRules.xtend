package com.incquerylabs.emdw.umlintegration.rules

import com.zeligsoft.xtumlrt.common.ChoicePoint
import com.incquerylabs.emdw.umlintegration.queries.ChoicePointMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Pseudostate
import com.zeligsoft.xtumlrt.common.StateMachine
import com.incquerylabs.emdw.umlintegration.queries.ToplevelChoicePointMatch
import com.zeligsoft.xtumlrt.common.CompositeState
import com.incquerylabs.emdw.umlintegration.queries.ChildChoicePointMatch

class ChoicePointRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new ChoicePointMapping(engine).specification,
			new ToplevelChoicePointMapping(engine).specification,
			new ChildChoicePointMapping(engine).specification
		}
	}
}

class ChoicePointMapping extends AbstractObjectRule<ChoicePointMatch, Pseudostate, ChoicePoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		ChoicePoint
	}

	override getRulePriority() {
		StateMachineUtil.VERTEX_MAPPING_PRIORITY
	}

	override getQuerySpecification() {
		choicePoint
	}

	override getUmlObject(ChoicePointMatch match) {
		match.pseudostate
	}

	override createXtumlrtObject(Pseudostate umlObject, ChoicePointMatch match) {
		commonFactory.createChoicePoint
	}

	override updateXtumlrtObject(ChoicePoint xtumlrtObject, ChoicePointMatch match) {
	}

	override protected insertXtumlrtObject(ChoicePoint xtumlrtObject, ChoicePointMatch match) {
	}
	
}

class ToplevelChoicePointMapping extends AbstractContainmentRule<ToplevelChoicePointMatch, StateMachine, ChoicePoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(StateMachineMapping.PRIORITY, StateMachineUtil.VERTEX_MAPPING_PRIORITY) + 1
	}

	override getQuerySpecification() {
		toplevelChoicePoint
	}

	override findParent(ToplevelChoicePointMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.stateMachine).head as StateMachine
	}
	
	override findChild(ToplevelChoicePointMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.pseudostate).head as ChoicePoint
	}
	
	override insertChild(StateMachine parent, ChoicePoint child) {
		parent.top.choicePoints += child
	}

}

class ChildChoicePointMapping extends AbstractContainmentRule<ChildChoicePointMatch, CompositeState, ChoicePoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		StateMachineUtil.VERTEX_MAPPING_PRIORITY + 1
	}

	override getQuerySpecification() {
		childChoicePoint
	}

	override findParent(ChildChoicePointMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.state).head as CompositeState
	}
	
	override findChild(ChildChoicePointMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.pseudostate).head as ChoicePoint
	}
	
	override insertChild(CompositeState parent, ChoicePoint child) {
		parent.choicePoints += child
	}

}