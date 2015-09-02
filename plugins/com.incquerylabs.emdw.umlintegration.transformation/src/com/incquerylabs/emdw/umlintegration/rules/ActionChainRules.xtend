package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ActionChainMatch
import com.incquerylabs.emdw.umlintegration.util.ModelUtil
import org.eclipse.papyrusrt.xtumlrt.common.ActionChain
import org.eclipse.papyrusrt.xtumlrt.common.Transition
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Behavior
import org.eclipse.papyrusrt.xtumlrt.common.ActionCode

class ActionChainRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new ActionChainMapping(engine)
		}
	}
}

/**
 * Transforms Behaviors which are a Transition's effect to the transformed Transition's action chain.  
 */
class ActionChainMapping extends AbstractObjectMapping<ActionChainMatch, Behavior, ActionChain> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		ActionChain
	}
	
	override getRulePriority() {
		TransitionMapping.PRIORITY + 1
	}

	override getQuerySpecification() {
		actionChain
	}

	override getUmlObject(ActionChainMatch match) {
		match.effect
	}

	override createXtumlrtObject() {
		commonFactory.createActionChain => [
			actions += commonFactory.createActionCode
		]
	}

	override updateXtumlrtObject(ActionChain xtumlrtObject, ActionChainMatch match) {
		(xtumlrtObject.actions.head as ActionCode).source = ModelUtil.getCppCode(match.umlObject)
		xtumlrtObject.actions.head.name =match.umlObject.name
	}

	def getXtumlrtContainer(ActionChainMatch match) {
		match.transition.findXtumlrtObject(Transition)
	}

	override insertXtumlrtObject(ActionChain xtumlrtObject, ActionChainMatch match) {
		match.xtumlrtContainer.actionChain = xtumlrtObject
	}

}
