package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.StateEntryBehaviorMatch
import com.incquerylabs.emdw.umlintegration.util.ModelUtil
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.ActionCode
import org.eclipse.uml2.uml.Behavior
import org.eclipse.papyrusrt.xtumlrt.common.State

class StateEntryRules {
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new StateEntryMapping(engine)
		}
	}
}

class StateEntryMapping extends AbstractObjectMapping<StateEntryBehaviorMatch, Behavior, ActionCode> {
	
	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		ActionCode
	}
	
	override getRulePriority() {
		SimpleStateMapping.PRIORITY + 1
	}
	
	override getQuerySpecification() {
		stateEntryBehavior
	}
	
	override protected getUmlObject(StateEntryBehaviorMatch match) {
		match.entry
	}
	
	override protected createXtumlrtObject() {
		commonFactory.createActionCode
	}
	
	override protected updateXtumlrtObject(ActionCode xtumlrtObject, StateEntryBehaviorMatch match) {
		xtumlrtObject.source = ModelUtil.getCppCode(match.umlObject)
		xtumlrtObject.name = match.umlObject.name
	}

	def getXtumlrtContainer(StateEntryBehaviorMatch match) {
		match.state.findXtumlrtObject(State)
	}
	
	override protected insertXtumlrtObject(ActionCode xtumlrtObject, StateEntryBehaviorMatch match) {
		match.xtumlrtContainer.entryAction = xtumlrtObject
	}
	
}