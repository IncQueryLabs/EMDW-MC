/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.OOPLExistingNameProvider
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEnumType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEnumerator
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import org.eclipse.papyrusrt.xtumlrt.common.Enumeration
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CPPEnumeratorMappingTest
])
@RunWith(Suite)
class CPPEnumeratorMappingTestSuite {}

class CPPEnumeratorMappingTest extends SingleComponentTransformTest {

	override protected prepareXtUmlModel(Model xtModel) {
		val component = xtModel.createXtComponent("component")
		val enumeration = component.createEnumerationWithTypeDefinition("colors")
		
		enumeration.createEnumerationLiteral("red")
		
		component
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		val rootDir = cppModel.headerDir
		val xtmodel = cppModel.commonModel
		val xtComponent = xtmodel.entities.filter(XTComponent).head
		
		// Component and its directories
		val cppComponent = cppModel.createCPPComponentWithDirectoriesAndFiles(xtComponent, rootDir)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val xtEnumerationLiteral = xtComponent.typeDefinitions.map[type].filter(Enumeration).head.literals.head
		val cppEnumType = cppComponent.subElements.filter(CPPEnumType).head
		val cppEnumerators = cppEnumType.enumerators
		val cppEnumerator = cppEnumerators.head as CPPEnumerator
		val containedEnumerators = cppEnumType.subElements.filter(CPPEnumerator)
		
		assertNotNull("CPPEnumerator is not converted", cppEnumerator)
		assertTrue("More than one CPPEnumerator is created", cppEnumerators.length <= 1)
		assertArrayEquals("CPPEnumerators are not contained in SubElements", containedEnumerators, cppEnumerators)
		assertEquals("CommonEnumerationLiteral of Enumerator is not set correctly", xtEnumerationLiteral, cppEnumerator.commonEnumerationLiteral)
		assertNotNull("Name provider is not set for Enumerator", cppEnumerator.ooplNameProvider)
		assertTrue("Wrong name provider", cppEnumerator.ooplNameProvider instanceof OOPLExistingNameProvider)
		val nameProvider = cppEnumerator.ooplNameProvider as OOPLExistingNameProvider
		assertEquals("Name provider is set incorrectly for CPPEnumerator", xtEnumerationLiteral ,nameProvider.commonNamedElement)
	}
	
	override protected clearXtUmlElement(XTComponent xtComponent) {
		xtComponent.typeDefinitions.map[type].filter(Enumeration).head.literals.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val enumerators = cppComponent.subElements.filter(CPPEnumType).head.enumerators
		assertEquals("CPPEnumerator is not removed", 0, enumerators.length)
	}
}
