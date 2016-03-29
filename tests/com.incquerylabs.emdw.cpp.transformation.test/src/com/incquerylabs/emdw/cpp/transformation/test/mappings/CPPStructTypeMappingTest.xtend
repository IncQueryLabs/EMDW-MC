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
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPStructType
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CPPStructTypeTest,
	CPPStructTypeInPackageTest
])
@RunWith(Suite)
class CPPStructTypeMappingTestSuite {}

class CPPStructTypeTest extends MappingBaseTest<XTComponent, CPPComponent> {
	
	override protected prepareXtUmlModel(Model xtModel) {
		val component = xtModel.createXtComponent("component")
		component.createStructuredTypeWithTypeDefinition("structuredType")
		
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
		val xtStructuredType = xtComponent.typeDefinitions.head.type
		val structTypes = cppComponent.subElements.filter(CPPStructType)
		val structType = structTypes.head
		assertNotNull("CPPStructType is not converted", structType)
		assertTrue("More than one StructType is created", structTypes.length <= 1)
		assertEquals("CommonType of StructType is not set correctly", xtStructuredType, structType.commonType)
		assertNotNull("Name provider is not set for StructType", structType.ooplNameProvider)
		assertTrue("Wrong name provider", structType.ooplNameProvider instanceof OOPLExistingNameProvider)
		val nameProvider = structType.ooplNameProvider as OOPLExistingNameProvider
		assertEquals("Name provider is set incorrectly for StructType", xtStructuredType ,nameProvider.commonNamedElement)
	}
	
	override protected clearXtUmlElement(XTComponent xtComponent) {
		xtComponent.typeDefinitions.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val structTypes = cppComponent.subElements.filter(CPPStructType)
		assertEquals("CPPStructType is not removed", 0, structTypes.length)
	}
}
class CPPStructTypeInPackageTest extends MappingBaseTest<XTComponent, CPPComponent> {
	
	override protected prepareXtUmlModel(Model xtModel) {
		val component = xtModel.createXtComponent("component")
		val xtPackage = component.createPackage("package")
		xtPackage.createStructuredTypeWithTypeDefinition("structuredType")
		
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
		val xtStructuredType = xtComponent.packages.head.typeDefinitions.head.type
		val structTypes = cppComponent.subElements.filter(CPPPackage).head.subElements.filter(CPPStructType)
		val structType = structTypes.head
		assertNotNull("CPPStructType is not converted", structType)
		assertTrue("More than one StructType is created", structTypes.length <= 1)
		assertEquals("CommonType of StructType is not set correctly", xtStructuredType, structType.commonType)
		assertNotNull("Name provider is not set for StructType", structType.ooplNameProvider)
		assertTrue("Wrong name provider", structType.ooplNameProvider instanceof OOPLExistingNameProvider)
		val nameProvider = structType.ooplNameProvider as OOPLExistingNameProvider
		assertEquals("Name provider is set incorrectly for StructType", xtStructuredType ,nameProvider.commonNamedElement)
	}
	
	override protected clearXtUmlElement(XTComponent xtComponent) {
		xtComponent.packages.head.typeDefinitions.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val structTypes = cppComponent.subElements.filter(CPPPackage).head.subElements.filter(CPPStructType)
		assertEquals("CPPStructType is not removed", 0, structTypes.length)
	}
}
