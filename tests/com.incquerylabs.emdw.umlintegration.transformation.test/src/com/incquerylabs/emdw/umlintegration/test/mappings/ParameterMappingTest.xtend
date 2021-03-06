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
import org.eclipse.papyrusrt.xtumlrt.common.Parameter
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static com.incquerylabs.emdw.testing.common.utils.ModelUtil.*
import static org.junit.Assert.*

@SuiteClasses(#[
	ParameterInOperationMappingTest,
	ParameterInOperationWithModifiedMultiplicityMappingTest
])
@RunWith(Suite)
class ParameterMappingTestSuite {}

class ParameterInOperationMappingTest extends TransformationTest<org.eclipse.uml2.uml.Parameter, Parameter> {

	override protected createUmlObject(Model umlRoot) {
		val type = umlRoot.createComponentInModel
		val operation = umlRoot.createOperation(TEST_SIDE_EFFECT_1, type)
		val parameter = operation.addInParameter(type, NAME_DEFAULT_PARAMETER)
		parameter
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTClass).head.operations.head.parameters
	}

	override protected checkXtumlrtObject(RootMapping mapping, org.eclipse.uml2.uml.Parameter umlObject, Parameter xtumlrtObject) {
		assertEquals(mapping.xtumlrtRoot.entities.filter(XTComponent).head, xtumlrtObject.type)
		assertEquals(umlObject.direction.transform, xtumlrtObject.direction)
		
		assertEquals("Parameter's (default) lower bound is not set correctly", 1, xtumlrtObject.lowerBound)
		assertEquals("Parameter's (default) upper bound is not set correctly", 1, xtumlrtObject.upperBound)
	}

}

class ParameterInOperationWithModifiedMultiplicityMappingTest extends TransformationTest<org.eclipse.uml2.uml.Parameter, Parameter> {

	override protected createUmlObject(Model umlRoot) {
		val type = umlRoot.createComponentInModel
		val operation = umlRoot.createOperation(TEST_SIDE_EFFECT_1, type)
		val parameter = operation.addInParameter(type, NAME_DEFAULT_PARAMETER)
		parameter.setMultiplicity(0, -1)
		
		parameter
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTClass).head.operations.head.parameters
	}

	override protected checkXtumlrtObject(RootMapping mapping, org.eclipse.uml2.uml.Parameter umlObject, Parameter xtumlrtObject) {
		assertEquals(mapping.xtumlrtRoot.entities.filter(XTComponent).head, xtumlrtObject.type)
		assertEquals(umlObject.direction.transform, xtumlrtObject.direction)
		
		assertEquals("Parameter's (default) lower bound is not set correctly", 0, xtumlrtObject.lowerBound)
		assertEquals("Parameter's (default) upper bound is not set correctly", -1, xtumlrtObject.upperBound)
	}

}
