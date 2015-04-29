package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPackage
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

@RunWith(Parameterized)
class CPPClassInPackageTest extends MappingBaseTest<XTPackage, CPPPackage> {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createXtPackage("RootPackage")
		pack.createXtClass("Class")
		
		pack
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.rootPackages.head as XTPackage
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		
		cppPackage
	}
	
	override protected assertResult(Model input, CPPModel result, XTPackage xtObject, CPPPackage cppObject) {
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
	
	override protected clearXtUmlElement(XTPackage xtObject) {
		val classes = xtObject.entities.filter(XTComponent)
		xtObject.entities.removeAll(classes)
	}
	
}


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
		val xtClasses = xtObject.topEntities.filter(XTClass)
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
		val classes = xtObject.topEntities.filter(XTComponent)
		xtObject.topEntities.removeAll(classes)
	}
	
}

@RunWith(Parameterized)
class CPPClassInComponentTest extends MappingBaseTest<XTComponent, CPPComponent> {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createXtPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		component.createXtClass("Class")
		
		component
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.rootPackages.head as XTPackage
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponent(cppPackage, xtComponent, null, null, null, null)
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTComponent xtObject, CPPComponent cppObject) {
		val xtClasses = xtObject.ownedClasses
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
		xtObject.ownedClasses.clear
	}
	
}
