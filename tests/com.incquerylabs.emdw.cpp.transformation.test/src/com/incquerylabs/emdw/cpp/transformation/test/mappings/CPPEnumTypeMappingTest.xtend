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
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CPPEnumTypeTest
])
@RunWith(Suite)
class CPPEnumTypeMappingTestSuite {}

class CPPEnumTypeTest extends MappingBaseTest<XTComponent, CPPComponent> {
	
	override protected prepareXtUmlModel(Model xtModel) {
		val component = xtModel.createXtComponent("component")
		component.createEnumerationWithTypeDefinition("colors")
		
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
		val xtEnumeration = xtComponent.typeDefinitions.head.type
		val enumTypes = cppComponent.subElements.filter(CPPEnumType)
		val enumType = enumTypes.head
		assertNotNull("CPPEnumType is not converted", enumType)
		assertTrue("More than one EnumType is created", enumTypes.length <= 1)
		assertEquals("CommonType of EnumType is not set correctly", xtEnumeration, enumType.commonType)
		assertNotNull("Name provider is not set for EnumType", enumType.ooplNameProvider)
		assertTrue("Wrong name provider", enumType.ooplNameProvider instanceof OOPLExistingNameProvider)
		val nameProvider = enumType.ooplNameProvider as OOPLExistingNameProvider
		assertEquals("Name provider is set incorrectly for StructType", xtEnumeration ,nameProvider.commonNamedElement)
	}
	
	override protected clearXtUmlElement(XTComponent xtComponent) {
		xtComponent.typeDefinitions.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val enumTypes = cppComponent.subElements.filter(CPPEnumType)
		assertEquals("CPPEnumType is not removed", 0, enumTypes.length)
	}
}
