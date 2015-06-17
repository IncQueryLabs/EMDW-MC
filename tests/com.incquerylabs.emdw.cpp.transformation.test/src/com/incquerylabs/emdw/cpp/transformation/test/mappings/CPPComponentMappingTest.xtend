package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.Ignore
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

@SuiteClasses(#[
	CPPComponentInPackageTest,
	CPPComponentInModelTest
])
@RunWith(Suite)
class CPPComponentMappingTestSuite {}

@Ignore("packages not yet in scope")
@RunWith(Parameterized)
class CPPComponentInPackageTest extends MappingBaseTest<Package, CPPPackage> {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		pack.createXtComponent("component")
		
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
		val xtComponents = xtObject.entities.filter(XTComponent)
		val cppComponents = cppObject.subElements.filter(CPPComponent)
		assertEquals(xtComponents.size,cppComponents.size)
		assertEquals(xtComponents.size*3,rootDir.countCppHeaderFiles)
		assertEquals(xtComponents.size,rootDir.countCppBodyFiles)
		cppComponents.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(xtComponent)
			assertNotNull(mainHeaderFile)
			assertNotNull(mainBodyFile)
			assertNotNull(declarationHeaderFile)
			assertNotNull(definitionHeaderFile)
		]
	}
	
	override protected clearXtUmlElement(Package xtObject) {
		val components = xtObject.entities.filter(XTComponent)
		xtObject.entities.removeAll(components)
	}
	
	override protected assertClear(Model input, CPPModel result, Package xtObject, CPPPackage cppObject) {
		val cppComponents = cppObject.subElements.filter(CPPComponent)
		assertEquals(0,cppComponents.size)
		assertEquals(0,rootDir.countCppHeaderFiles)
		assertEquals(0,rootDir.countCppBodyFiles)
	}
	
}

@Ignore("component not yet in scope")
@RunWith(Parameterized)
class CPPComponentInModelTest extends MappingBaseTest<Model, CPPModel> {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		model.createXtComponent("component")
		
		model
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		cppModel
	}
	
	override protected assertResult(Model input, CPPModel result, Model xtObject, CPPModel cppObject) {
		val xtComponents = xtObject.entities.filter(XTComponent)
		val cppComponents = cppObject.subElements.filter(CPPComponent)
		assertEquals(xtComponents.size,cppComponents.size)
		assertEquals(xtComponents.size*3,rootDir.countCppHeaderFiles)
		assertEquals(xtComponents.size,rootDir.countCppBodyFiles)
		cppComponents.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(xtComponent)
			assertNotNull(mainHeaderFile)
			assertNotNull(mainBodyFile)
			assertNotNull(declarationHeaderFile)
			assertNotNull(definitionHeaderFile)
		]
	}
	
	override protected clearXtUmlElement(Model xtObject) {
		val components = xtObject.entities.filter(XTComponent)
		xtObject.entities.removeAll(components)
	}
	
	override protected assertClear(Model input, CPPModel result, Model xtObject, CPPModel cppObject) {
		val cppComponents = cppObject.subElements.filter(CPPComponent)
		assertEquals(0,cppComponents.size)
		assertEquals(0,rootDir.countCppHeaderFiles)
		assertEquals(0,rootDir.countCppBodyFiles)
	}
	
}