package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

@SuiteClasses(#[
	CPPAttributeInClassTest,
	CPPAttributeInComponentTest
])
@RunWith(Suite)
class CPPAttributeMappingTestSuite {}

@RunWith(Parameterized)
class CPPAttributeInClassTest extends MappingBaseTest<XTClass, CPPComponent> {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("Class")
		xtClass.createSingleAttribute(xtClass, VisibilityKind.PUBLIC, false, "Attribute")
		
		xtClass
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponent(cppPackage, xtComponent, null, null, null, null)
		
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		cppComponent.headerDirectory = rootDir
		cppComponent.bodyDirectory = rootDir
		
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


@RunWith(Parameterized)
class CPPAttributeInComponentTest extends MappingBaseTest<XTComponent, CPPComponent> {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("Class")
		component.createSingleAttribute(xtClass, VisibilityKind.PUBLIC, false, "Attribute")
		
		component
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponent(cppPackage, xtComponent, null, null, null, null)
		
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		cppComponent.headerDirectory = rootDir
		cppComponent.bodyDirectory = rootDir
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTComponent xtObject, CPPComponent cppObject) {
		val xtAttr = xtObject.attributes
		val cppAttrs = cppObject.subElements.filter(CPPAttribute)
		assertEquals(xtAttr.size,cppAttrs.size)
		cppAttrs.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(commonAttribute)
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