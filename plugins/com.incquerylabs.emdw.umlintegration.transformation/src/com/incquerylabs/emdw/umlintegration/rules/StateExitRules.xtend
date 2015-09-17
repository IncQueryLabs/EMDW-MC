package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.StateExitBehaviorMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAction
import org.eclipse.uml2.uml.Behavior
import org.eclipse.uml2.uml.OpaqueBehavior
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil

class StateExitRules {
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new StateExitMapping(engine)
		}
	}
}

class StateExitMapping extends AbstractObjectMapping<StateExitBehaviorMatch, Behavior, XTAction> {
	
	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		XTAction
	}
	
	override getRulePriority() {
		CommonPriorities.ACTION_MAPPING_PRIORITY
	}
	
	override getQuerySpecification() {
		stateExitBehavior
	}
	
	override protected getUmlObject(StateExitBehaviorMatch match) {
		match.exit
	}
	
	override protected createXtumlrtObject() {
		xtumlFactory.createXTAction
	}
	
	override protected updateXtumlrtObject(XTAction xtumlrtObject, StateExitBehaviorMatch match) {
		val behavior = match.umlObject
		xtumlrtObject.name = behavior.name
		if(behavior instanceof OpaqueBehavior) {
			TransformationUtil.mapXTAction(behavior, xtumlrtObject)
		}
	}

	def getXtumlrtContainer(StateExitBehaviorMatch match) {
		match.state.findXtumlrtObject(State)
	}
	
	override protected insertXtumlrtObject(XTAction xtumlrtObject, StateExitBehaviorMatch match) {
		match.xtumlrtContainer.exitAction = xtumlrtObject
	}
	
}