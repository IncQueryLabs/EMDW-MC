/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Denes Harmath - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ActionChainMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.ActionChain
import org.eclipse.papyrusrt.xtumlrt.common.Transition
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAction
import org.eclipse.uml2.uml.Behavior
import org.eclipse.uml2.uml.OpaqueBehavior
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil

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
			actions += xtumlFactory.createXTAction
		]
	}

	override updateXtumlrtObject(ActionChain xtumlrtObject, ActionChainMatch match) {
		val behavior = match.umlObject
		xtumlrtObject.name = behavior.name
		if(behavior instanceof OpaqueBehavior) {
			val xtAction = xtumlrtObject.actions.head as XTAction
			TransformationUtil.mapXTAction(behavior, xtAction)
		}
	}

	def getXtumlrtContainer(ActionChainMatch match) {
		match.transition.findXtumlrtObject(Transition)
	}

	override insertXtumlrtObject(ActionChain xtumlrtObject, ActionChainMatch match) {
		match.xtumlrtContainer.actionChain = xtumlrtObject
	}

}
