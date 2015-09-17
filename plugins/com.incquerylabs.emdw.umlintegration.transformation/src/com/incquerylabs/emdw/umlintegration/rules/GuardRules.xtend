package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.GuardMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Guard
import org.eclipse.papyrusrt.xtumlrt.common.Transition
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAction
import org.eclipse.uml2.uml.Constraint
import org.eclipse.uml2.uml.OpaqueExpression
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil

class GuardRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new GuardMapping(engine)
		}
	}
}

/**
 * Transforms Constraints which are a Transition's guard to the transformed Transition's guard.  
 */
class GuardMapping extends AbstractObjectMapping<GuardMatch, Constraint, Guard> {

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
			body = xtumlFactory.createXTAction
		]
	}

	override updateXtumlrtObject(Guard xtumlrtObject, GuardMatch match) {
		xtumlrtObject.name = match.umlObject.name
		val xtAction = xtumlrtObject.body as XTAction
		val behavior = match.umlObject.specification as OpaqueExpression
		TransformationUtil.mapXTAction(behavior, xtAction)
	}

	def getXtumlrtContainer(GuardMatch match) {
		match.transition.findXtumlrtObject(Transition)
	}

	override insertXtumlrtObject(Guard xtumlrtObject, GuardMatch match) {
		match.xtumlrtContainer.guard = xtumlrtObject
	}
	
}
