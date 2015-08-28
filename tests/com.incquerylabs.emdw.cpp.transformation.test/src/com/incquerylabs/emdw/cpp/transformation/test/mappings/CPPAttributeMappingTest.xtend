package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEvent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CPPAttributeInClassTest,
	CPPAttributeInComponentTest,
	CPPAttributeInEventTest
])
@RunWith(Suite)
class CPPAttributeMappingTestSuite {}

class CPPAttributeInClassTest extends MappingBaseTest<XTClass, CPPComponent> {
	CPPDirectory rootDir;
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("Class")
		val xtTypeDef = pack.createTypeDefinition("td")
		val xtType = createPrimitiveType(xtTypeDef, "primitiveType")
		xtClass.createSingleAttribute(xtType, VisibilityKind.PUBLIC, false, "Attribute")
		
		xtClass
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		rootDir = cppModel.headerDir
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponentWithDirectoriesAndFiles(cppPackage, xtComponent, rootDir)
		createCPPBasicType(cppPackage, xtPackage.typeDefinitions.head.type)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTClass xtObject, CPPComponent cppObject) {
		val xtAttr = xtObject.attributes
		val cppClass = cppObject.subElements.filter(CPPClass).head
		val cppAttrs = cppClass.subElements.filter(CPPAttribute)
		assertEquals(xtAttr.size,cppAttrs.size)
		cppAttrs.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(commonAttribute)
		]
	}
	
	override protected clearXtUmlElement(XTClass xtObject) {
		xtObject.attributes.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTClass xtObject, CPPComponent cppObject) {
		val cppClass = cppObject.subElements.filter(CPPClass).head
		val cppAttrs = cppClass.subElements.filter(CPPAttribute)
		assertEquals(0,cppAttrs.size)
	}
	
}


class CPPAttributeInComponentTest extends MappingBaseTest<XTComponent, CPPComponent> {
	CPPDirectory rootDir;
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtTypeDef = pack.createTypeDefinition("td")
		val xtType = createPrimitiveType(xtTypeDef, "primitiveType")
		component.createListAttribute(xtType, VisibilityKind.PUBLIC, false, "Attribute")
		
		component
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		rootDir = cppModel.headerDir
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackageWithDirectoriesAndFiles(cppModel, xtPackage, rootDir)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponentWithDirectoriesAndFiles(cppPackage, xtComponent, cppPackage.headerDir)
		
		createCPPBasicType(cppPackage, xtPackage.typeDefinitions.head.type)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTComponent xtObject, CPPComponent cppObject) {
		val xtAttr = xtObject.attributes
		val cppAttrs = cppObject.subElements.filter(CPPAttribute)
		assertEquals(xtAttr.size,cppAttrs.size)
		cppAttrs.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(commonAttribute)
			assertNotNull(unnamedSequenceType)
			assertNotNull(unnamedSequenceType.elementType)
		]
	}
	
	override protected clearXtUmlElement(XTComponent xtObject) {
		xtObject.attributes.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTComponent xtObject, CPPComponent cppObject) {
		val cppAttrs = cppObject.subElements.filter(CPPAttribute)
		assertEquals(0,cppAttrs.size)
	}
	
}

class CPPAttributeInEventTest extends MappingBaseTest<XTClassEvent, CPPComponent> {
	CPPDirectory rootDir;
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("Class")
		val xtClassEvent = xtClass.createXtClassEvent("ClassEvent")
		val xtTypeDef = pack.createTypeDefinition("td")
		val xtType = createPrimitiveType(xtTypeDef, "primitiveType")
		xtClassEvent.createSingleAttribute(xtType, VisibilityKind.PUBLIC, false, "Attribute")
		
		xtClassEvent
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		rootDir = cppModel.headerDir
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponentWithDirectoriesAndFiles(cppPackage, xtComponent, rootDir)
		createCPPBasicType(cppPackage, xtPackage.typeDefinitions.head.type)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTClassEvent xtObject, CPPComponent cppObject) {
		val xtAttr = xtObject.attributes
		val cppClass = cppObject.subElements.filter(CPPClass).head
		val cppEvent = cppClass.subElements.filter(CPPEvent).head
		val cppAttrs = cppEvent.subElements.filter(CPPAttribute)
		assertEquals(xtAttr.size,cppAttrs.size)
		cppAttrs.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(commonAttribute)
		]
	}
	
	override protected clearXtUmlElement(XTClassEvent xtObject) {
		xtObject.attributes.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTClassEvent xtObject, CPPComponent cppObject) {
		val cppClass = cppObject.subElements.filter(CPPClass).head
		val cppEvent = cppClass.subElements.filter(CPPEvent).head
		val cppAttrs = cppEvent.subElements.filter(CPPAttribute)
		assertEquals(0,cppAttrs.size)
	}
	
}
