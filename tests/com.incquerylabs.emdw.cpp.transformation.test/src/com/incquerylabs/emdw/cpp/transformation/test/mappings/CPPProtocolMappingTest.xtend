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

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPProtocol
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.junit.Ignore
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CPPProtocolInPackageTest,
	CPPProtocolInModelTest
])
@RunWith(Suite)
class CPPProtocolMappingTestSuite {}

@Ignore("protocols not yet in scope")
class CPPProtocolInPackageTest extends MappingBaseTest<Package, CPPPackage> {
	CPPDirectory rootDir;
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		pack.createXtProtocol("Protocol")
		
		pack
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		rootDir = cppModel.headerDir
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		
		cppPackage
	}
	
	override protected assertResult(Model input, CPPModel result, Package xtObject, CPPPackage cppObject) {
		val xtProtocols = xtObject.protocols
		val cppProtocols = cppObject.subElements.filter(CPPProtocol)
		assertEquals(xtProtocols.size,cppProtocols.size)
		assertEquals(xtProtocols.size,rootDir.countCppHeaderFiles)
		cppProtocols.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(xtProtocol)
			assertNotNull(headerFile)
		]
	}
	
	override protected clearXtUmlElement(Package xtObject) {
		xtObject.protocols.clear
	}
	
	override protected assertClear(Model input, CPPModel result, Package xtObject, CPPPackage cppObject) {
		val cppProtocols = cppObject.subElements.filter(CPPProtocol)
		assertEquals(0,cppProtocols.size)
		assertEquals(0,rootDir.countCppHeaderFiles)
	}
	
}

@Ignore("protocols not yet in scope")
class CPPProtocolInModelTest extends MappingBaseTest<Model, CPPModel> {
	CPPDirectory rootDir;
	
	override protected prepareXtUmlModel(Model model) {
		model.createXtProtocol("Protocol")
		
		model
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		rootDir = cppModel.headerDir
		cppModel
	}
	
	override protected assertResult(Model input, CPPModel result, Model xtObject, CPPModel cppObject) {
		val xtProtocols = xtObject.protocols
		val cppProtocols = cppObject.subElements.filter(CPPProtocol)
		assertEquals(xtProtocols.size,cppProtocols.size)
		assertEquals(xtProtocols.size,rootDir.countCppHeaderFiles)
		cppProtocols.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(xtProtocol)
			assertNotNull(headerFile)
		]
	}
	
	override protected clearXtUmlElement(Model xtObject) {
		xtObject.protocols.clear
	}
	
	override protected assertClear(Model input, CPPModel result, Model xtObject, CPPModel cppObject) {
		val cppProtocols = cppObject.subElements.filter(CPPProtocol)
		assertEquals(0,cppProtocols.size)
		assertEquals(0,rootDir.countCppHeaderFiles)
	}
	
}
