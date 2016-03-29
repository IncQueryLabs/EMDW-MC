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

import com.incquerylabs.emdw.umlintegration.queries.ChildJunctionPointMatch
import com.incquerylabs.emdw.umlintegration.queries.JunctionPointMatch
import com.incquerylabs.emdw.umlintegration.queries.ToplevelJunctionPointMatch
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.papyrusrt.xtumlrt.common.JunctionPoint
import org.eclipse.papyrusrt.xtumlrt.common.StateMachine
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Pseudostate

class JunctionPointRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new JunctionPointMapping(engine),
			new ToplevelJunctionPointMapping(engine),
			new ChildJunctionPointMapping(engine)
		}
	}
}

/**
 * Transforms Pseudostates of junction point kind to JunctionPoints.
 */
class JunctionPointMapping extends AbstractObjectMapping<JunctionPointMatch, Pseudostate, JunctionPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		JunctionPoint
	}

	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY
	}

	override getQuerySpecification() {
		junctionPoint
	}

	override getUmlObject(JunctionPointMatch match) {
		match.pseudostate
	}

	override createXtumlrtObject() {
		commonFactory.createJunctionPoint
	}

	override updateXtumlrtObject(JunctionPoint xtumlrtObject, JunctionPointMatch match) {
	}

	override protected insertXtumlrtObject(JunctionPoint xtumlrtObject, JunctionPointMatch match) {
	}
	
}

/**
 * Inserts JunctionPoints to their parent StateMachine.
 */
class ToplevelJunctionPointMapping extends AbstractContainmentMapping<ToplevelJunctionPointMatch, StateMachine, JunctionPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(StateMachineMapping.PRIORITY, CommonPriorities.VERTEX_MAPPING_PRIORITY) + 1
	}

	override getQuerySpecification() {
		toplevelJunctionPoint
	}

	override findParent(ToplevelJunctionPointMatch match) {
		match.stateMachine.findXtumlrtObject(StateMachine)
	}
	
	override findChild(ToplevelJunctionPointMatch match) {
		match.pseudostate.findXtumlrtObject(JunctionPoint)
	}
	
	override insertChild(StateMachine parent, JunctionPoint child, ToplevelJunctionPointMatch match) {
		parent.top.junctionPoints += child
	}

}

/**
 * Inserts JunctionPoints to their parent CompositeState.
 */
class ChildJunctionPointMapping extends AbstractContainmentMapping<ChildJunctionPointMatch, CompositeState, JunctionPoint> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		CommonPriorities.VERTEX_MAPPING_PRIORITY + 1
	}

	override getQuerySpecification() {
		childJunctionPoint
	}

	override findParent(ChildJunctionPointMatch match) {
		match.state.findXtumlrtObject(CompositeState)
	}
	
	override findChild(ChildJunctionPointMatch match) {
		match.pseudostate.findXtumlrtObject(JunctionPoint)
	}
	
	override insertChild(CompositeState parent, JunctionPoint child, ChildJunctionPointMatch match) {
		parent.junctionPoints += child
	}

}