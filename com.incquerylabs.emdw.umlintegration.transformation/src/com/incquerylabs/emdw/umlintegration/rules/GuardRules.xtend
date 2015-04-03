package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.GuardMatch
import com.incquerylabs.emdw.umlintegration.util.ModelUtil
import com.zeligsoft.xtumlrt.common.Guard
import com.zeligsoft.xtumlrt.common.Transition
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Constraint

class GuardRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new GuardMapping(engine).specification
		}
	}
}

class GuardMapping extends AbstractObjectRule<GuardMatch, Constraint, Guard> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		Guard
	}
	
	override getRulePriority() {
		TransitionMapping.PRIORITY + 1
	}

	override getQuerySpecification() {
		guard
	}

	override getUmlObject(GuardMatch match) {
		match.guard
	}

	override createXtumlrtObject() {
		commonFactory.createGuard => [
			body = commonFactory.createActionCode
		]
	}

	override updateXtumlrtObject(Guard xtumlrtObject, GuardMatch match) {
		xtumlrtObject.body.source = ModelUtil.getCppCode(match.umlObject)
	}

	def getXtumlrtContainer(GuardMatch match) {
		match.transition.findXtumlrtObject(Transition)
	}

	override insertXtumlrtObject(Guard xtumlrtObject, GuardMatch match) {
		match.xtumlrtContainer.guard = xtumlrtObject
	}
	
}
