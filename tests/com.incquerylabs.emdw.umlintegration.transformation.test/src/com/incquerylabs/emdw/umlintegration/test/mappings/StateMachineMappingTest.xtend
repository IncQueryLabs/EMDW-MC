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
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.StateMachine
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	StateMachineMappingTest
])
@RunWith(Suite)
class StateMachineMappingTestSuite {}

class StateMachineMappingTest extends TransformationTest<StateMachine, org.eclipse.papyrusrt.xtumlrt.common.StateMachine> {

	override protected createUmlObject(Model umlRoot) {
		umlRoot.createStateMachine
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.head.behaviour.asSet
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, StateMachine umlObject, org.eclipse.papyrusrt.xtumlrt.common.StateMachine xtumlrtObject) {
	}

}