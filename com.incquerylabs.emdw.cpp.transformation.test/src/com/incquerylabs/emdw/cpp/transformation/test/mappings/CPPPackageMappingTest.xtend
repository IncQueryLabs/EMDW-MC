
package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.junit.Ignore
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

@SuiteClasses(#[
	CPPPackageInPackageTest,
	CPPPackageInModelTest
])
@RunWith(Suite) 
class CPPPackageMappingTestSuite {}

@Ignore("packages not yet in scope")
@RunWith(Parameterized)
class CPPPackageInPackageTest extends MappingBaseTest<Package, CPPPackage> {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		pack.createPackage("component")
		
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
		val xtPackages = xtObject.packages
		val cppPackages = cppObject.subElements.filter(CPPPackage)
		assertEquals(xtPackages.size,cppPackages.size)
		cppPackages.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(commonPackage)
		]
	}
	
	override protected clearXtUmlElement(Package xtObject) {
		xtObject.packages.clear
	}
	
	override protected assertClear(Model input, CPPModel result, Package xtObject, CPPPackage cppObject) {
		val cppPackages = cppObject.subElements.filter(CPPPackage)
		assertEquals(0,cppPackages.size)
	}
	
}

@Ignore("packages not yet in scope")
@RunWith(Parameterized)
class CPPPackageInModelTest extends MappingBaseTest<Model, CPPModel> {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		model.createPackage("component")
		
		model
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		cppModel
	}
	
	override protected assertResult(Model input, CPPModel result, Model xtObject, CPPModel cppObject) {
		val xtPackages = xtObject.packages
		val cppPackages = cppObject.subElements.filter(CPPPackage)
		assertEquals(xtPackages.size,cppPackages.size)
		cppPackages.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(commonPackage)
		]
	}
	
	override protected clearXtUmlElement(Model xtObject) {
		xtObject.packages.clear
	}
	
	override protected assertClear(Model input, CPPModel result, Model xtObject, CPPModel cppObject) {
		val cppPackages = cppObject.subElements.filter(CPPPackage)
		assertEquals(0,cppPackages.size)
	}
	
}
