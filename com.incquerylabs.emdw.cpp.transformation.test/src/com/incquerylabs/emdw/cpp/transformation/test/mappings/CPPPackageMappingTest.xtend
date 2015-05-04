package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPackage
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

@RunWith(Parameterized)
class CPPPackageInPackageTest extends MappingBaseTest<XTPackage, CPPPackage> {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createXtPackage("RootPackage")
		pack.createXtPackage("component")
		
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
		val xtPackages = xtObject.packages
		val cppPackages = cppObject.subElements.filter(CPPPackage)
		assertEquals(xtPackages.size,cppPackages.size)
		cppPackages.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(xtPackage)
		]
	}
	
	override protected clearXtUmlElement(XTPackage xtObject) {
		xtObject.packages.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTPackage xtObject, CPPPackage cppObject) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}


@RunWith(Parameterized)
class CPPPackageInModelTest extends MappingBaseTest<Model, CPPModel> {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		model.createXtPackage("component")
		
		model
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		cppModel
	}
	
	override protected assertResult(Model input, CPPModel result, Model xtObject, CPPModel cppObject) {
		val xtPackages = xtObject.rootPackages
		val cppPackages = cppObject.subElements.filter(CPPPackage)
		assertEquals(xtPackages.size,cppPackages.size)
		cppPackages.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(xtPackage)
		]
	}
	
	override protected clearXtUmlElement(Model xtObject) {
		xtObject.rootPackages.clear
	}
	
	override protected assertClear(Model input, CPPModel result, Model xtObject, CPPModel cppObject) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}
