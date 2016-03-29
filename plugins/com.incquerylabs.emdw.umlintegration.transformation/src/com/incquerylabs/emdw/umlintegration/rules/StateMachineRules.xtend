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

import com.incquerylabs.emdw.umlintegration.queries.StateMachineMatch
import org.eclipse.papyrusrt.xtumlrt.common.StateMachine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine

class StateMachineRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new StateMachineMapping(engine)
		}
	}
}

/**
 * Transform StateMachines which are a BehavioredClassifier's classifier behavior to the transformed XTClass's behaviour.
 */
class StateMachineMapping extends AbstractObjectMapping<StateMachineMatch, org.eclipse.uml2.uml.StateMachine, StateMachine> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		StateMachine
	}
	
	public static val PRIORITY = XTClassMapping.PRIORITY + 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		stateMachine
	}

	override getUmlObject(StateMachineMatch match) {
		match.stateMachine
	}

	override createXtumlrtObject() {
		commonFactory.createStateMachine => [
			top = commonFactory.createCompositeState
		]
	}

	override updateXtumlrtObject(StateMachine xtumlrtObject, StateMachineMatch match) {
	}

	def getXtumlrtContainer(StateMachineMatch match) {
		match.behavioredClassifier.findXtumlrtObject(XTClass)
	}

	override insertXtumlrtObject(StateMachine xtumlrtObject, StateMachineMatch match) {
		match.xtumlrtContainer.behaviour = xtumlrtObject
	}
	
}
