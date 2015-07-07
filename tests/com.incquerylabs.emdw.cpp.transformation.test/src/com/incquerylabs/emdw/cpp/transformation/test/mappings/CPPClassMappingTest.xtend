package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.Ignore
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

@SuiteClasses(#[
	CPPClassInPackageTest,
	CPPClassInModelTest,
	CPPClassInComponentTest,
	CPPClassSingleComponentTransformTest
])
@RunWith(Suite)
class CPPClassMappingTestSuite {}

//@Ignore("packages not yet in scope")
@RunWith(Parameterized)
class CPPClassInPackageTest extends MappingBaseTest<Package, CPPComponent> {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val rootPackage = model.createPackage("RootPackage")
		val component = rootPackage.createXtComponent("Component")
		val innerPackage = component.createPackage("InnerPackage")
		innerPackage.createXtClass("Class")
		
		innerPackage
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponent(cppPackage, xtComponent, null, null, null, null)
		cppComponent.headerDirectory = rootDir
		cppComponent.bodyDirectory = rootDir
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, Package xtObject, CPPComponent cppObject) {
		val xtClasses = xtObject.entities.filter(XTClass)
		val cppPackage = cppObject.subElements.filter(CPPPackage).head
		val cppClasses = cppPackage.subElements.filter(CPPClass)
		assertEquals(xtClasses.size,cppClasses.size)
		assertEquals(xtClasses.size+1,rootDir.countCppHeaderFiles)
		assertEquals(xtClasses.size+1,rootDir.countCppBodyFiles)
		cppClasses.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(xtClass)
			assertNotNull(headerFile)
			assertNotNull(bodyFile)
		]
	}
	
	override protected clearXtUmlElement(Package xtObject) {
		val classes = xtObject.entities.filter(XTClass)
		xtObject.entities.removeAll(classes)
	}
	
	override protected assertClear(Model input, CPPModel result, Package xtObject, CPPComponent cppObject) {
		val cppPackage = cppObject.subElements.filter(CPPPackage).head
		val cppClasses = cppPackage.subElements.filter(CPPClass)
		assertEquals(0, cppClasses.size)
		assertEquals(1, rootDir.countCppHeaderFiles)
		assertEquals(1, rootDir.countCppBodyFiles)
	}
	
}

@Ignore("model not yet in scope")
@RunWith(Parameterized)
class CPPClassInModelTest extends MappingBaseTest<Model, CPPModel> {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		model.createXtClass("Class")
		
		model
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		cppModel
	}
	
	override protected assertResult(Model input, CPPModel result, Model xtObject, CPPModel cppObject) {
		val xtClasses = xtObject.entities.filter(XTClass)
		val cppClasses = cppObject.subElements.filter(CPPClass)
		assertEquals(xtClasses.size,cppClasses.size)
		assertEquals(xtClasses.size,rootDir.countCppHeaderFiles)
		assertEquals(xtClasses.size,rootDir.countCppBodyFiles)
		cppClasses.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(xtClass)
			assertNotNull(headerFile)
			assertNotNull(bodyFile)
		]
	}
	
	override protected clearXtUmlElement(Model xtObject) {
		val classes = xtObject.entities.filter(XTClass)
		xtObject.entities.removeAll(classes)
	}
	
	override protected assertClear(Model input, CPPModel result, Model xtObject, CPPModel cppObject) {
		val cppClasses = cppObject.subElements.filter(CPPClass)
		assertEquals(0, cppClasses.size)
		assertEquals(0, rootDir.countCppHeaderFiles)
		assertEquals(0, rootDir.countCppBodyFiles)
	}
	
}

@RunWith(Parameterized)
class CPPClassInComponentTest extends MappingBaseTest<XTComponent, CPPComponent> {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		component.createXtClass("Class")
		
		return component
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
		
		return cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTComponent xtObject, CPPComponent cppObject) {
		val xtClasses = xtObject.entities
		val cppClasses = cppObject.subElements.filter(CPPClass)
		assertEquals(xtClasses.size,cppClasses.size)
		assertEquals(xtClasses.size,rootDir.countCppHeaderFiles)
		assertEquals(xtClasses.size,rootDir.countCppBodyFiles)
		cppClasses.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(xtClass)
			assertNotNull(headerFile)
			assertNotNull(bodyFile)
		]
	}
	
	override protected clearXtUmlElement(XTComponent xtObject) {
		xtObject.entities.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTComponent xtObject, CPPComponent cppObject) {
		val cppClasses = cppObject.subElements.filter(CPPClass)
		assertEquals(0,cppClasses.size)
		assertEquals(0,rootDir.countCppHeaderFiles)
		assertEquals(0,rootDir.countCppBodyFiles)
	}
	
}

@RunWith(Parameterized)
class CPPClassSingleComponentTransformTest extends SingleComponentTransformTest {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val otherComponent = pack.createXtComponent("OtherComponent")
		component.createXtClass("Class")
		otherComponent.createXtClass("OtherClass")
		
		return component
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = cppModel.createCPPPackage(xtPackage)
		val xtComponent = xtPackage.entities.filter(XTComponent).filter[it.name=="Component"].head
		val otherXtComponent = xtPackage.entities.filter(XTComponent).filter[it.name=="OtherComponent"].head
		val cppComponent = cppPackage.createCPPComponent(xtComponent, null, null, null, null)
		val otherCppComponent = cppPackage.createCPPComponent(otherXtComponent, null, null, null, null)
		
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		cppComponent.headerDirectory = rootDir.createCPPSubDirectory
		cppComponent.bodyDirectory = cppComponent.headerDirectory
		otherCppComponent.headerDirectory = rootDir.createCPPSubDirectory
		otherCppComponent.bodyDirectory = cppComponent.headerDirectory
		
		return cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val cppPackage = result.subElements.filter(CPPPackage).head
		val cppComponents = cppPackage.subElements.filter(CPPComponent)
		
		val transformedCppComponent = cppComponents.filter[it.xtComponent.name == "Component"].head
		val otherCppComponent = cppComponents.filter[it.xtComponent.name == "OtherComponent"].head
		
		val cppClasses = transformedCppComponent.subElements.filter(CPPClass)
		val otherCppClasses = otherCppComponent.subElements.filter(CPPClass)
		
		assertEquals(1, cppClasses.size)
		assertEquals(0, otherCppClasses.size)
	}
	
	override protected clearXtUmlElement(XTComponent xtComponent) {
		xtComponent.entities.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val cppPackage = result.subElements.filter(CPPPackage).head
		val cppComponents = cppPackage.subElements.filter(CPPComponent)
		
		val transformedCppComponent = cppComponents.filter[it.xtComponent.name == "Component"].head
		val otherCppComponent = cppComponents.filter[it.xtComponent.name == "OtherComponent"].head
		
		val cppClasses = transformedCppComponent.subElements.filter(CPPClass)
		val otherCppClasses = otherCppComponent.subElements.filter(CPPClass)
		
		assertEquals(0, cppClasses.size)
		assertEquals(0, otherCppClasses.size)
	}
	
}
