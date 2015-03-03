package com.incquerylabs.emdw.umlintegration.rules

import com.zeligsoft.xtumlrt.common.ChoicePoint
import com.incquerylabs.emdw.umlintegration.queries.ChoiceStateMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Pseudostate
import com.zeligsoft.xtumlrt.common.StateMachine
import com.incquerylabs.emdw.umlintegration.queries.ToplevelChoiceStateMatch
import com.zeligsoft.xtumlrt.common.CompositeState
import com.incquerylabs.emdw.umlintegration.queries.ChildChoiceStateMatch

class ChoiceStateRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new ChoiceStateMapping(engine).specification,
			new ToplevelChoiceStateMapping(engine).specification,
			new ChildChoiceStateMapping(engine).specification
		}
	}
}

class ChoiceStateMapping extends AbstractObjectRule<ChoiceStateMatch, Pseudostate, ChoicePoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		ChoicePoint
	}

	override getRulePriority() {
		5
	}

	override getQuerySpecification() {
		choiceState
	}

	override getUmlObject(ChoiceStateMatch match) {
		match.pseudostate
	}

	override createXtumlrtObject(Pseudostate umlObject, ChoiceStateMatch match) {
		commonFactory.createChoicePoint
	}

	override updateXtumlrtObject(ChoicePoint xtumlrtObject, ChoiceStateMatch match) {
	}

	override protected insertXtumlrtObject(ChoicePoint xtumlrtObject, ChoiceStateMatch match) {
	}
	
}

class ToplevelChoiceStateMapping extends AbstractContainmentRule<ToplevelChoiceStateMatch, StateMachine, ChoicePoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		6
	}

	override getQuerySpecification() {
		toplevelChoiceState
	}

	override findParent(ToplevelChoiceStateMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.stateMachine).head as StateMachine
	}
	
	override findChild(ToplevelChoiceStateMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.pseudostate).head as ChoicePoint
	}
	
	override insertChild(StateMachine parent, ChoicePoint child) {
		parent.top.choicePoints += child
	}

}

class ChildChoiceStateMapping extends AbstractContainmentRule<ChildChoiceStateMatch, CompositeState, ChoicePoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		6
	}

	override getQuerySpecification() {
		childChoiceState
	}

	override findParent(ChildChoiceStateMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.state).head as CompositeState
	}
	
	override findChild(ChildChoiceStateMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.pseudostate).head as ChoicePoint
	}
	
	override insertChild(CompositeState parent, ChoicePoint child) {
		parent.choicePoints += child
	}

}