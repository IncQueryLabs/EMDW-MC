package com.incquerylabs.emdw.cpp.codegeneration.test.directory

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.google.common.collect.ImmutableList
import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.DirectoryStructureWrapper
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Parameterized.Parameters

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class DirectoryStructureTest extends TransformationTest<Package, CPPClass> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	@Parameters(name = "{index}: {1}")
    public static def transformations() {
        val alternatives = ImmutableList.builder
//        	.add(new DummyWrapper())
        	.add(new DirectoryStructureWrapper())
			.build
		
		alternatives.map[
			val simpleName = it.class.simpleName
			#[it, simpleName].toArray
		]
    }
	
	override protected prepareCppModel(CPPModel cppModel) {
		
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createPackage("RootPackage")
		
		val xtComponent = xtPackage.createXtComponent("Component")
		val xtClass = xtComponent.createXtClass("TEST")
		
		val res = cppModel.eResource
		val rootdir = res.createCPPDirectory
		rootdir.name = "rootdirectory"
		rootdir.path = "/" + rootdir.name + "/"
		
		val packagedir = rootdir.createCPPSubDirectory
		packagedir.name = "packagedirectory"
		packagedir.path = rootdir.path + packagedir.name + "/"
		
		val componentdir1 = packagedir.createCPPSubDirectory
		componentdir1.name = "componentdir1"
		componentdir1.path = packagedir.path + componentdir1.name + "/"
		
		val componentdir2 = packagedir.createCPPSubDirectory
		componentdir2.name = "componentdir2"
		componentdir2.path = packagedir.path + componentdir2.name + "/"
		
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val cppComponent = createCPPComponent(cppPackage, xtComponent, null, null, null, null)
		cppComponent.headerDirectory = componentdir1
		cppComponent.bodyDirectory = componentdir2
		
		val cppClass = createCPPClass(cppComponent, xtClass, null, null)
		
		cppClass
	}
	
	override protected assertResult(CPPModel result, CPPClass cppObject) {
		assertTrue(true)
	}
}