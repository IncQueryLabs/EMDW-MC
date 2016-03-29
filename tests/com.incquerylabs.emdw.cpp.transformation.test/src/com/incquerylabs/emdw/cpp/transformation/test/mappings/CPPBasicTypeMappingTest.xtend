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
import com.ericsson.xtumlrt.oopl.cppmodel.CPPBasicType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CPPBasicTypeTest,
	CPPBasicTypeInPackageTest
])
@RunWith(Suite)
class CPPBasicTypeMappingTestSuite {
}

class CPPBasicTypeTest extends MappingBaseTest<XTComponent, CPPComponent> {
	
	override protected prepareXtUmlModel(Model xtModel) {
		val component = xtModel.createXtComponent("component")
		component.createPrimitiveTypeWithTypeDefinition("primitiveType")
		
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
		val xtPrimitiveType = xtComponent.typeDefinitions.head.type
		val basicTypes = cppComponent.subElements.filter(CPPBasicType)
		val basicType = basicTypes.head
		assertNotNull("CPPBasicType is not converted", basicType)
		assertTrue("More than one CPPBasicType is created", basicTypes.length <= 1)
		assertEquals("CommonType of CPPBasicType is not set correctly", xtPrimitiveType, basicType.commonType)
		assertNotNull("Name provider is not set for CPPBasicType", basicType.ooplNameProvider)
		assertTrue("Wrong name provider", basicType.ooplNameProvider instanceof OOPLExistingNameProvider)
		val nameProvider = basicType.ooplNameProvider as OOPLExistingNameProvider
		assertEquals("Name provider is set incorrectly for StructType", xtPrimitiveType ,nameProvider.commonNamedElement)
	}
	
	override protected clearXtUmlElement(XTComponent xtComponent) {
		xtComponent.typeDefinitions.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val basicTypes = cppComponent.subElements.filter(CPPBasicType)
		assertEquals("CPPBasicType is not removed", 0, basicTypes.length)
	}
}

class CPPBasicTypeInPackageTest extends MappingBaseTest<XTComponent, CPPComponent> {
	
	override protected prepareXtUmlModel(Model xtModel) {
		val component = xtModel.createXtComponent("component")
		val xtPackage = component.createPackage("package")
		xtPackage.createPrimitiveTypeWithTypeDefinition("primitiveType")
		
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
		val xtPrimitiveType = xtComponent.packages.head.typeDefinitions.head.type
		val basicTypes = cppComponent.subElements.filter(CPPPackage).head.subElements.filter(CPPBasicType)
		val basicType = basicTypes.head
		assertNotNull("CPPBasicType is not converted", basicType)
		assertTrue("More than one CPPBasicType is created", basicTypes.length <= 1)
		assertEquals("CommonType of CPPBasicType is not set correctly", xtPrimitiveType, basicType.commonType)
		assertNotNull("Name provider is not set for CPPBasicType", basicType.ooplNameProvider)
		assertTrue("Wrong name provider", basicType.ooplNameProvider instanceof OOPLExistingNameProvider)
		val nameProvider = basicType.ooplNameProvider as OOPLExistingNameProvider
		assertEquals("Name provider is set incorrectly for StructType", xtPrimitiveType ,nameProvider.commonNamedElement)
	}
	
	override protected clearXtUmlElement(XTComponent xtComponent) {
		xtComponent.packages.head.typeDefinitions.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val basicTypes = cppComponent.subElements.filter(CPPPackage).head.subElements.filter(CPPBasicType)
		assertEquals("CPPBasicType is not removed", 0, basicTypes.length)
	}
}
