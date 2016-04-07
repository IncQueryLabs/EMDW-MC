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
package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.papyrusrt.xtumlrt.common.JunctionPoint
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Pseudostate
import org.eclipse.uml2.uml.PseudostateKind
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	ToplevelJunctionPointMappingTest,
	ChildJunctionPointMappingTest
])
@RunWith(Suite)
class JunctionPointMappingTestSuite {}

class ToplevelJunctionPointMappingTest extends TransformationTest<Pseudostate, JunctionPoint> {

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = umlRoot.createStateMachine
		stateMachine.regions.head.createPseudostate("junctionState", PseudostateKind.JUNCTION_LITERAL)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.xtumlrtTopState.junctionPoints
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Pseudostate umlObject, JunctionPoint xtumlrtObject) {
	}
	
}

class ChildJunctionPointMappingTest extends TransformationTest<Pseudostate, JunctionPoint> {

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = umlRoot.createStateMachine
		val parentState = stateMachine.createCompositeState("parentState")
		parentState.regions.head.createPseudostate("childJunctionPoint", PseudostateKind.JUNCTION_LITERAL)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.xtumlrtTopState.substates.head as CompositeState).junctionPoints
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Pseudostate umlObject, JunctionPoint xtumlrtObject) {
	}
	
}