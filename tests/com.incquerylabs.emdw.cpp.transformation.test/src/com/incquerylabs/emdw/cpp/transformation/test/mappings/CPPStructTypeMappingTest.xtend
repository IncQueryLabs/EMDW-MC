package com.incquerylabs.emdw.cpp.transformation.test.mappings

import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.Model
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*
import com.ericsson.xtumlrt.oopl.cppmodel.CPPStructType
import com.ericsson.xtumlrt.oopl.OOPLExistingNameProvider
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage

@SuiteClasses(#[
	CPPStructTypeTest,
	CPPStructTypeInPackageTest
])
@RunWith(Suite)
class CPPStructTypeMappingTestSuite {}

@RunWith(Parameterized)
class CPPStructTypeTest extends MappingBaseTest<XTComponent, CPPComponent> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model xtModel) {
		val component = xtModel.createXtComponent("component")
		component.createStructuredTypeWithTypeDefinition("structuredType")
		
		component
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		val rootDir = res.createCPPDirectory
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
@RunWith(Parameterized)
class CPPStructTypeInPackageTest extends MappingBaseTest<XTComponent, CPPComponent> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model xtModel) {
		val component = xtModel.createXtComponent("component")
		val xtPackage = component.createPackage("package")
		xtPackage.createStructuredTypeWithTypeDefinition("structuredType")
		
		component
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		val rootDir = res.createCPPDirectory
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
