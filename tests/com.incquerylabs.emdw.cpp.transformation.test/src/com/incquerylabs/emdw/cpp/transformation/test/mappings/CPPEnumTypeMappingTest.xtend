package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.OOPLExistingNameProvider
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPStructType
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEnumType

@SuiteClasses(#[
	CPPEnumTypeTest
])
@RunWith(Suite)
class CPPEnumTypeMappingTestSuite {}

@RunWith(Parameterized)
class CPPEnumTypeTest extends MappingBaseTest<XTComponent, CPPComponent> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model xtModel) {
		val component = xtModel.createXtComponent("component")
		component.createEnumerationWithTypeDefinition("colors")
		
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
		val structTypes = cppComponent.subElements.filter(CPPStructType)
		assertEquals("CPPStructType is not removed", 0, structTypes.length)
	}
}
