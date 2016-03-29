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