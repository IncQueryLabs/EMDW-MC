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
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPort
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Port
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	XTPortMappingTest
])
@RunWith(Suite)
class XTPortMappingTestSuite {}

class XTPortMappingTest extends TransformationTest<Port, XTPort> {

	override protected createUmlObject(Model umlRoot) {
		val component = umlRoot.createComponentInModel
		createPort(component)
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.entities.head as XTComponent).ports.filter(XTPort)
	}

	override protected checkXtumlrtObject(RootMapping mapping, Port umlObject, XTPort xtumlrtObject) {
		assertEquals(umlObject.conjugated, xtumlrtObject.conjugate) 
	}

}
