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

import com.incquerylabs.emdw.umlintegration.queries.ChildDeepHistoryMatch
import com.incquerylabs.emdw.umlintegration.queries.DeepHistoryMatch
import com.incquerylabs.emdw.umlintegration.queries.ToplevelDeepHistoryMatch
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.papyrusrt.xtumlrt.common.DeepHistory
import org.eclipse.papyrusrt.xtumlrt.common.StateMachine
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Pseudostate

class DeepHistoryRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new DeepHistoryMapping(engine),
			new ToplevelDeepHistoryMapping(engine),
			new ChildDeepHistoryMapping(engine)
		}
	}
}

/**
 * Transforms Pseudostates of deep history kind to DeepHistories.
 */
class DeepHistoryMapping extends AbstractObjectMapping<DeepHistoryMatch, Pseudostate, DeepHistory> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		DeepHistory
	}
	
	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY
	}

	override getQuerySpecification() {
		deepHistory
	}

	override getUmlObject(DeepHistoryMatch match) {
		match.pseudostate
	}

	override createXtumlrtObject() {
		commonFactory.createDeepHistory
	}

	override updateXtumlrtObject(DeepHistory xtumlrtObject, DeepHistoryMatch match) {
	}

	override protected insertXtumlrtObject(DeepHistory xtumlrtObject, DeepHistoryMatch match) {
	}
	
}

/**
 * Inserts DeepHistories to their parent StateMachine.
 */
class ToplevelDeepHistoryMapping extends AbstractContainmentMapping<ToplevelDeepHistoryMatch, StateMachine, DeepHistory> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(StateMachineMapping.PRIORITY, CommonPriorities.VERTEX_MAPPING_PRIORITY) + 1
	}

	override getQuerySpecification() {
		toplevelDeepHistory
	}

	override findParent(ToplevelDeepHistoryMatch match) {
		match.stateMachine.findXtumlrtObject(StateMachine)
	}
	
	override findChild(ToplevelDeepHistoryMatch match) {
		match.pseudostate.findXtumlrtObject(DeepHistory)
	}
	
	override insertChild(StateMachine parent, DeepHistory child, ToplevelDeepHistoryMatch match) {
		parent.top.deepHistory = child
	}

}

/**
 * Inserts DeepHistories to their parent CompositeState.
 */
class ChildDeepHistoryMapping extends AbstractContainmentMapping<ChildDeepHistoryMatch, CompositeState, DeepHistory> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY + 1
	}

	override getQuerySpecification() {
		childDeepHistory
	}

	override findParent(ChildDeepHistoryMatch match) {
		match.state.findXtumlrtObject(CompositeState)
	}
	
	override findChild(ChildDeepHistoryMatch match) {
		match.pseudostate.findXtumlrtObject(DeepHistory)
	}
	
	override insertChild(CompositeState parent, DeepHistory child, ChildDeepHistoryMatch match) {
		parent.deepHistory = child
	}

}