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
	CPPClassInComponentTest
])
@RunWith(Suite)
class CPPClassMappingTestSuite {}

@Ignore("packages not yet in scope")
@RunWith(Parameterized)
class CPPClassInPackageTest extends MappingBaseTest<Package, CPPPackage> {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		pack.createXtClass("Class")
		
		pack
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		
		cppPackage
	}
	
	override protected assertResult(Model input, CPPModel result, Package xtObject, CPPPackage cppObject) {
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
	
	override protected clearXtUmlElement(Package xtObject) {
		val classes = xtObject.entities.filter(XTClass)
		xtObject.entities.removeAll(classes)
	}
	
	override protected assertClear(Model input, CPPModel result, Package xtObject, CPPPackage cppObject) {
		val cppClasses = cppObject.subElements.filter(CPPClass)
		assertEquals(0, cppClasses.size)
		assertEquals(0, rootDir.countCppHeaderFiles)
		assertEquals(0, rootDir.countCppBodyFiles)
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
