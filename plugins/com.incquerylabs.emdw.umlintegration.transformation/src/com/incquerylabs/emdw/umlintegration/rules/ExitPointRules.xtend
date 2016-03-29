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

import com.incquerylabs.emdw.umlintegration.queries.ChildExitPointMatch
import com.incquerylabs.emdw.umlintegration.queries.ExitPointMatch
import com.incquerylabs.emdw.umlintegration.queries.ToplevelExitPointMatch
import org.eclipse.papyrusrt.xtumlrt.common.ExitPoint
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.eclipse.papyrusrt.xtumlrt.common.StateMachine
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Pseudostate

class ExitPointRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new ExitPointMapping(engine),
			new ToplevelExitPointMapping(engine),
			new ChildExitPointMapping(engine)
		}
	}
}

/**
 * Transforms Pseudostates of exit point kind to ExitPoints.
 */
class ExitPointMapping extends AbstractObjectMapping<ExitPointMatch, Pseudostate, ExitPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		ExitPoint
	}

	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY
	}

	override getQuerySpecification() {
		exitPoint
	}

	override getUmlObject(ExitPointMatch match) {
		match.pseudostate
	}

	override createXtumlrtObject() {
		commonFactory.createExitPoint
	}

	override updateXtumlrtObject(ExitPoint xtumlrtObject, ExitPointMatch match) {
	}

	override protected insertXtumlrtObject(ExitPoint xtumlrtObject, ExitPointMatch match) {
	}
	
}

/**
 * Inserts ExitPoints to their parent StateMachine.
 */
class ToplevelExitPointMapping extends AbstractContainmentMapping<ToplevelExitPointMatch, StateMachine, ExitPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(StateMachineMapping.PRIORITY, CommonPriorities.VERTEX_MAPPING_PRIORITY) + 1
	}

	override getQuerySpecification() {
		toplevelExitPoint
	}

	override findParent(ToplevelExitPointMatch match) {
		match.stateMachine.findXtumlrtObject(StateMachine)
	}
	
	override findChild(ToplevelExitPointMatch match) {
		match.pseudostate.findXtumlrtObject(ExitPoint)
	}
	
	override insertChild(StateMachine parent, ExitPoint child, ToplevelExitPointMatch match) {
		parent.top.exitPoints += child
	}

}

/**
 * Inserts ExitPoints to their parent CompositeState.
 */
class ChildExitPointMapping extends AbstractContainmentMapping<ChildExitPointMatch, State, ExitPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY + 1
	}

	override getQuerySpecification() {
		childExitPoint
	}

	override findParent(ChildExitPointMatch match) {
		match.state.findXtumlrtObject(State)
	}
	
	override findChild(ChildExitPointMatch match) {
		match.pseudostate.findXtumlrtObject(ExitPoint)
	}
	
	override insertChild(State parent, ExitPoint child, ChildExitPointMatch match) {
		parent.exitPoints += child
	}

}