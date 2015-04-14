package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ChildChoicePointMatch
import com.incquerylabs.emdw.umlintegration.queries.ChoicePointMatch
import com.incquerylabs.emdw.umlintegration.queries.ToplevelChoicePointMatch
import com.zeligsoft.xtumlrt.common.ChoicePoint
import com.zeligsoft.xtumlrt.common.CompositeState
import com.zeligsoft.xtumlrt.common.StateMachine
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Pseudostate

class ChoicePointRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new ChoicePointMapping(engine),
			new ToplevelChoicePointMapping(engine),
			new ChildChoicePointMapping(engine)
		}
	}
}

class ChoicePointMapping extends AbstractObjectMapping<ChoicePointMatch, Pseudostate, ChoicePoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		ChoicePoint
	}

	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY
	}

	override getQuerySpecification() {
		choicePoint
	}

	override getUmlObject(ChoicePointMatch match) {
		match.pseudostate
	}

	override createXtumlrtObject() {
		commonFactory.createChoicePoint
	}

	override updateXtumlrtObject(ChoicePoint xtumlrtObject, ChoicePointMatch match) {
	}

	override protected insertXtumlrtObject(ChoicePoint xtumlrtObject, ChoicePointMatch match) {
	}
	
}

class ToplevelChoicePointMapping extends AbstractContainmentMapping<ToplevelChoicePointMatch, StateMachine, ChoicePoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(StateMachineMapping.PRIORITY, CommonPriorities.VERTEX_MAPPING_PRIORITY) + 1
	}

	override getQuerySpecification() {
		toplevelChoicePoint
	}

	override findParent(ToplevelChoicePointMatch match) {
		match.stateMachine.findXtumlrtObject(StateMachine)
	}
	
	override findChild(ToplevelChoicePointMatch match) {
		match.pseudostate.findXtumlrtObject(ChoicePoint)
	}
	
	override insertChild(StateMachine parent, ChoicePoint child) {
		parent.top.choicePoints += child
	}

}

class ChildChoicePointMapping extends AbstractContainmentMapping<ChildChoicePointMatch, CompositeState, ChoicePoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY + 1
	}

	override getQuerySpecification() {
		childChoicePoint
	}

	override findParent(ChildChoicePointMatch match) {
		match.state.findXtumlrtObject(CompositeState)
	}
	
	override findChild(ChildChoicePointMatch match) {
		match.pseudostate.findXtumlrtObject(ChoicePoint)
	}
	
	override insertChild(CompositeState parent, ChoicePoint child) {
		parent.choicePoints += child
	}

}