package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.StateEntryBehaviorMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAction
import org.eclipse.uml2.uml.Behavior
import org.eclipse.uml2.uml.OpaqueBehavior
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil

class StateEntryRules {
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new StateEntryMapping(engine)
		}
	}
}

class StateEntryMapping extends AbstractObjectMapping<StateEntryBehaviorMatch, Behavior, XTAction> {
	
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
		stateEntryBehavior
	}
	
	override protected getUmlObject(StateEntryBehaviorMatch match) {
		match.entry
	}
	
	override protected createXtumlrtObject() {
		xtumlFactory.createXTAction
	}
	
	override protected updateXtumlrtObject(XTAction xtumlrtObject, StateEntryBehaviorMatch match) {
		val behavior = match.umlObject
		xtumlrtObject.name = behavior.name
		if(behavior instanceof OpaqueBehavior) {
			TransformationUtil.mapXTAction(behavior, xtumlrtObject)
		}
	}

	def getXtumlrtContainer(StateEntryBehaviorMatch match) {
		match.state.findXtumlrtObject(State)
	}
	
	override protected insertXtumlrtObject(XTAction xtumlrtObject, StateEntryBehaviorMatch match) {
		match.xtumlrtContainer.entryAction = xtumlrtObject
	}
	
}