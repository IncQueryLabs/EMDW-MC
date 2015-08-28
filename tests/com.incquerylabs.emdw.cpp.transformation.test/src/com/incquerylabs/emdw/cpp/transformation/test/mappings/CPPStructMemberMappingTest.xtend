package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.OOPLExistingNameProvider
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPStructMember
import com.ericsson.xtumlrt.oopl.cppmodel.CPPStructType
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.StructuredType
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CPPStructMemberTest
])
@RunWith(Suite)
class CPPStructMemberMappingTestSuite {}

class CPPStructMemberTest extends SingleComponentTransformTest {
	
	override protected prepareXtUmlModel(Model xtModel) {
		val component = xtModel.createXtComponent("component")
		val primitiveType = component.createPrimitiveTypeWithTypeDefinition("primitiveType")
		val structuredType = component.createStructuredTypeWithTypeDefinition("structuredType")
		createSingleAttribute(structuredType, primitiveType, VisibilityKind.PUBLIC, false, "structMember")
		
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
		val xtAttribute = xtComponent.typeDefinitions.map[type].filter(StructuredType).head.attributes.head
		val cppStructType = cppComponent.subElements.filter(CPPStructType).head
		val structMembers = cppStructType.members
		val structMember = structMembers.head as CPPStructMember
		val containedStructMembers = cppStructType.subElements.filter(CPPStructMember)
		
		assertNotNull("CPPStructMember is not converted", structMember)
		assertTrue("More than one StructMember is created", structMembers.length <= 1)
		assertArrayEquals("StructMembers are not contained in SubElements", containedStructMembers, structMembers)
		assertEquals("CommonMember of StructMember is not set correctly", xtAttribute, structMember.commonMember)
		assertNotNull("Name provider is not set for StructMember", structMember.ooplNameProvider)
		assertTrue("Wrong name provider", structMember.ooplNameProvider instanceof OOPLExistingNameProvider)
		val nameProvider = structMember.ooplNameProvider as OOPLExistingNameProvider
		assertEquals("Name provider is set incorrectly for StructMember", xtAttribute ,nameProvider.commonNamedElement)
		// TODO: type is derived and unchangeable
//		val cppBasicType = cppComponent.subElements.filter(CPPBasicType).head
//		assertEquals("StructMember type is incorrect", cppBasicType, structMember.type)
	}
	
	override protected clearXtUmlElement(XTComponent xtComponent) {
		xtComponent.typeDefinitions.map[type].filter(StructuredType).head.attributes.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val structMembers = cppComponent.subElements.filter(CPPStructType).head.members
		assertEquals("CPPStructMember is not removed", 0, structMembers.length)
	}
}
