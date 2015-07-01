package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.StateExitBehaviorMatch
import com.incquerylabs.emdw.umlintegration.util.ModelUtil
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.ActionCode
import org.eclipse.uml2.uml.Behavior
import org.eclipse.papyrusrt.xtumlrt.common.State

class StateExitRules {
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new StateExitMapping(engine)
		}
	}
}

class StateExitMapping extends AbstractObjectMapping<StateExitBehaviorMatch, Behavior, ActionCode> {
	
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
		stateExitBehavior
	}
	
	override protected getUmlObject(StateExitBehaviorMatch match) {
		match.exit
	}
	
	override protected createXtumlrtObject() {
		commonFactory.createActionCode
	}
	
	override protected updateXtumlrtObject(ActionCode xtumlrtObject, StateExitBehaviorMatch match) {
		xtumlrtObject.source = ModelUtil.getCppCode(match.umlObject)
		xtumlrtObject.name = match.umlObject.name
	}

	def getXtumlrtContainer(StateExitBehaviorMatch match) {
		match.state.findXtumlrtObject(State)
	}
	
	override protected insertXtumlrtObject(ActionCode xtumlrtObject, StateExitBehaviorMatch match) {
		match.xtumlrtContainer.exitAction = xtumlrtObject
	}
	
}