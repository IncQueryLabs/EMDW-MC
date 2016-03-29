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

import com.incquerylabs.emdw.umlintegration.queries.ChildTerminatePointMatch
import com.incquerylabs.emdw.umlintegration.queries.TerminatePointMatch
import com.incquerylabs.emdw.umlintegration.queries.ToplevelTerminatePointMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.papyrusrt.xtumlrt.common.StateMachine
import org.eclipse.papyrusrt.xtumlrt.common.TerminatePoint
import org.eclipse.uml2.uml.Pseudostate

class TerminatePointRules {
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new TerminateMapping(engine),
			new ToplevelTerminateMapping(engine),
			new ChildTerminateMapping(engine)
		}
	}
}

/**
 * Transforms Pseudostates of terminate kind to TerminatePoints.
 */
class TerminateMapping extends AbstractObjectMapping<TerminatePointMatch, Pseudostate, TerminatePoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		TerminatePoint
	}

	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY
	}

	override getQuerySpecification() {
		terminatePoint
	}

	override getUmlObject(TerminatePointMatch match) {
		match.pseudostate
	}

	override createXtumlrtObject() {
		commonFactory.createTerminatePoint
	}

	override updateXtumlrtObject(TerminatePoint xtumlrtObject, TerminatePointMatch match) {
	}

	override protected insertXtumlrtObject(TerminatePoint xtumlrtObject, TerminatePointMatch match) {
	}
}

/**
 * Inserts TerminatePoints to their parent StateMachine.
 */
class ToplevelTerminateMapping extends AbstractContainmentMapping<ToplevelTerminatePointMatch, StateMachine, TerminatePoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(StateMachineMapping.PRIORITY, CommonPriorities.VERTEX_MAPPING_PRIORITY) + 1
	}

	override getQuerySpecification() {
		toplevelTerminatePoint
	}

	override findParent(ToplevelTerminatePointMatch match) {
		match.stateMachine.findXtumlrtObject(StateMachine)
	}
	
	override findChild(ToplevelTerminatePointMatch match) {
		match.pseudostate.findXtumlrtObject(TerminatePoint)
	}
	
	override insertChild(StateMachine parent, TerminatePoint child, ToplevelTerminatePointMatch match) {
		parent.top.terminatepoint = child
	}

}

/**
 * Inserts TerminatePoints to their parent CompositeState.
 */
class ChildTerminateMapping extends AbstractContainmentMapping<ChildTerminatePointMatch, CompositeState, TerminatePoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY + 1
	}

	override getQuerySpecification() {
		childTerminatePoint
	}

	override findParent(ChildTerminatePointMatch match) {
		match.state.findXtumlrtObject(CompositeState)
	}
	
	override findChild(ChildTerminatePointMatch match) {
		match.pseudostate.findXtumlrtObject(TerminatePoint)
	}
	
	override insertChild(CompositeState parent, TerminatePoint child, ChildTerminatePointMatch match) {
		parent.terminatepoint = child
	}

}
