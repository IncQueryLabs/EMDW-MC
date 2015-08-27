package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.OOPLExistingNameProvider
import com.ericsson.xtumlrt.oopl.cppmodel.CPPBasicType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage

@SuiteClasses(#[
	CPPBasicTypeTest,
	CPPBasicTypeInPackageTest
])
@RunWith(Suite)
class CPPBasicTypeMappingTestSuite {
}

@RunWith(Parameterized)
class CPPBasicTypeTest extends MappingBaseTest<XTComponent, CPPComponent> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model xtModel) {
		val component = xtModel.createXtComponent("component")
		component.createPrimitiveTypeWithTypeDefinition("primitiveType")
		
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

@RunWith(Parameterized)
class CPPBasicTypeInPackageTest extends MappingBaseTest<XTComponent, CPPComponent> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model xtModel) {
		val component = xtModel.createXtComponent("component")
		val xtPackage = component.createPackage("package")
		xtPackage.createPrimitiveTypeWithTypeDefinition("primitiveType")
		
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
