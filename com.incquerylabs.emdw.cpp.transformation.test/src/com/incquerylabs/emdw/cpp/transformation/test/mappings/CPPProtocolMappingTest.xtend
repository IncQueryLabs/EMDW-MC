package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPProtocol
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPackage
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

@RunWith(Parameterized)
class CPPProtocolInPackageTest extends MappingBaseTest<XTPackage, CPPPackage> {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createXtPackage("RootPackage")
		pack.createXtProtocol("Protocol")
		
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
	
	override protected clearXtUmlElement(XTPackage xtObject) {
		xtObject.protocols.clear
	}
	
}


@RunWith(Parameterized)
class CPPProtocolInModelTest extends MappingBaseTest<Model, CPPModel> {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		model.createXtProtocol("Protocol")
		
		model
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		cppModel
	}
	
	override protected assertResult(Model input, CPPModel result, Model xtObject, CPPModel cppObject) {
		val xtProtocols = xtObject.topProtocols
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
		xtObject.topProtocols.clear
	}
	
}
