package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.StateDoBehaviorMatch
import com.incquerylabs.emdw.umlintegration.util.ModelUtil
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.ActionCode
import org.eclipse.uml2.uml.Behavior
import org.eclipse.papyrusrt.xtumlrt.common.State

class StateDoActivityRules {
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new StateDoActivityMapping(engine)
		}
	}
}

class StateDoActivityMapping extends AbstractObjectMapping<StateDoBehaviorMatch, Behavior, ActionCode> {
	
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
		stateDoBehavior
	}
	
	override protected getUmlObject(StateDoBehaviorMatch match) {
		match.doActivity
	}
	
	override protected createXtumlrtObject() {
		commonFactory.createActionCode
	}
	
	override protected updateXtumlrtObject(ActionCode xtumlrtObject, StateDoBehaviorMatch match) {
		xtumlrtObject.source = ModelUtil.getCppCode(match.umlObject)
		xtumlrtObject.name = match.umlObject.name
	}

	def getXtumlrtContainer(StateDoBehaviorMatch match) {
		match.state.findXtumlrtObject(State)
	}
	
	override protected insertXtumlrtObject(ActionCode xtumlrtObject, StateDoBehaviorMatch match) {
		//match.xtumlrtContainer.??? = xtumlrtObject
	}
	
}