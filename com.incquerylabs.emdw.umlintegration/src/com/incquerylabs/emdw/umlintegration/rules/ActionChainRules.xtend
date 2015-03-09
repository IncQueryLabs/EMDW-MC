package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ActionChainMatch
import com.zeligsoft.xtumlrt.common.Transition
import com.zeligsoft.xtumlrt.common.ActionChain
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Behavior
import com.zeligsoft.umlrt.codegen.cpp.ModelUtil

class ActionChainRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new ActionChainMapping(engine).specification
		}
	}
}

class ActionChainMapping extends AbstractObjectRule<ActionChainMatch, Behavior, ActionChain> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		ActionChain
	}
	
	override getRulePriority() {
		7
	}

	override getQuerySpecification() {
		actionChain
	}

	override getUmlObject(ActionChainMatch match) {
		match.effect
	}

	override createXtumlrtObject(Behavior umlObject, ActionChainMatch match) {
		commonFactory.createActionChain => [
			actions += commonFactory.createActionCode
		]
	}

	override updateXtumlrtObject(ActionChain xtumlrtObject, ActionChainMatch match) {
		xtumlrtObject.actions.head.source = ModelUtil.getCppCode(match.umlObject)
	}

	def getXtumlrtContainer(ActionChainMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.transition).head as Transition
	}

	override insertXtumlrtObject(ActionChain xtumlrtObject, ActionChainMatch match) {
		match.xtumlrtContainer.actionChain = xtumlrtObject
	}
	
}
