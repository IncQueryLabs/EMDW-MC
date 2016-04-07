/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.Ignore
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CPPClassInPackageTest,
	CPPClassInModelTest,
	CPPClassInComponentTest,
	CPPClassSingleComponentTransformTest
])
@RunWith(Suite)
class CPPClassMappingTestSuite {}

class CPPClassInPackageTest extends MappingBaseTest<Package, CPPComponent> {
	CPPDirectory rootDir;
	
	override protected prepareXtUmlModel(Model model) {
		val rootPackage = model.createPackage("RootPackage")
		val component = rootPackage.createXtComponent("Component")
		val innerPackage = component.createPackage("InnerPackage")
		innerPackage.createXtClass("Class")
		
		innerPackage
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		rootDir = cppModel.headerDir
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponentWithDirectoriesAndFiles(cppPackage, xtComponent, rootDir)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, Package xtObject, CPPComponent cppObject) {
		val xtClasses = xtObject.entities.filter(XTClass)
		val cppPackage = cppObject.subElements.filter(CPPPackage).head
		val cppClasses = cppPackage.subElements.filter(CPPClass)
		val packageDir = cppPackage.headerDir
		assertEquals(xtClasses.size,cppClasses.size)
		assertEquals(xtClasses.size+1,packageDir.countCppHeaderFiles)
		assertEquals(xtClasses.size+1,packageDir.countCppBodyFiles)
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
		val packageDir = cppPackage.headerDir
		assertEquals(0, cppClasses.size)
		assertEquals(1, packageDir.countCppHeaderFiles)
		assertEquals(1, packageDir.countCppBodyFiles)
	}
	
}

@Ignore("model not yet in scope")
class CPPClassInModelTest extends MappingBaseTest<Model, CPPModel> {
	CPPDirectory rootDir;
	
	override protected prepareXtUmlModel(Model model) {
		model.createXtClass("Class")
		
		model
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		rootDir = cppModel.headerDir
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

class CPPClassInComponentTest extends MappingBaseTest<XTComponent, CPPComponent> {
	CPPDirectory rootDir;
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		component.createXtClass("Class")
		
		return component
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		rootDir = cppModel.headerDir
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val cppPackageDir = cppPackage.headerDir
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponentWithDirectoriesAndFiles(cppPackage, xtComponent, cppPackageDir)
		
		return cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTComponent xtObject, CPPComponent cppObject) {
		val xtClasses = xtObject.entities
		val cppClasses = cppObject.subElements.filter(CPPClass)
		assertEquals(xtClasses.size,cppClasses.size)
		assertEquals(1, rootDir.subDirectories.size)
		val componentDir = cppObject.headerDirectory
		assertEquals(xtClasses.size+3,componentDir.countCppHeaderFiles)
		assertEquals(xtClasses.size+1,componentDir.countCppBodyFiles)
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
		assertEquals(1, rootDir.subDirectories.size)
		val componentDir = cppObject.headerDirectory
		assertEquals(3,componentDir.countCppHeaderFiles)
		assertEquals(1,componentDir.countCppBodyFiles)
	}
	
}

class CPPClassSingleComponentTransformTest extends SingleComponentTransformTest {
	CPPDirectory rootDir;
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val otherComponent = pack.createXtComponent("OtherComponent")
		component.createXtClass("Class")
		otherComponent.createXtClass("OtherClass")
		
		return component
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		rootDir = cppModel.headerDir
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = cppModel.createCPPPackage(xtPackage)
		val xtComponent = xtPackage.entities.filter(XTComponent).filter[it.name=="Component"].head
		val otherXtComponent = xtPackage.entities.filter(XTComponent).filter[it.name=="OtherComponent"].head
		val cppComponent = cppPackage.createCPPComponentWithDirectoriesAndFiles(xtComponent, rootDir)
		cppPackage.createCPPComponentWithDirectoriesAndFiles(otherXtComponent, rootDir)
		
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
