package com.incquerylabs.emdw.cpp.codegeneration.test.directory

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTestUtil.*
import org.junit.FixMethodOrder
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory

@RunWith(Parameterized)
@FixMethodOrder
class DirectoryStructureTest extends DirectoryStructureBaseTest<Package, CPPModel> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareFirstCPPModel(CPPModel cppModel, String rootDirName) {
		
		val res = cppModel.eResource
		val rootdir = res.createCPPDirectory
		rootdir.name = "rootdirectory"
		rootdir.path = "/" + rootdir.name + "/"
		
		val packagedir1 = rootdir.createCPPSubDirectory
		packagedir1.name = "packagedirectory_1"
		packagedir1.path = rootdir.path + packagedir1.name + "/"
		
		val componentdir1 = packagedir1.createCPPSubDirectory
		componentdir1.name = "componentdirectory_1"
		componentdir1.path = packagedir1.path + componentdir1.name + "/"
		
		val componentdir2 = packagedir1.createCPPSubDirectory
		componentdir2.name = "componentdirertory_2"
		componentdir2.path = packagedir1.path + componentdir2.name + "/"
		
		var returnMap = (<CPPModel, CPPDirectory>newHashMap)
		returnMap.put(cppModel, rootdir)
		returnMap
	}
	
	override protected prepareSecondCPPModel(CPPModel cppModel, String rootDirName) {
		val res = cppModel.eResource
		val rootdir = res.createCPPDirectory
		rootdir.name = "rootdirectory"
		rootdir.path = "/" + rootdir.name + "/"
		
		val packagedir1 = rootdir.createCPPSubDirectory
		packagedir1.name = "packagedirectory_1"
		packagedir1.path = rootdir.path + packagedir1.name + "/"
		
		val packagedir2 = rootdir.createCPPSubDirectory
		packagedir2.name = "packagedirectory_2"
		packagedir2.path = rootdir.path + packagedir2.name + "/"
		
		val componentdir1 = packagedir1.createCPPSubDirectory
		componentdir1.name = "componentdirectory_1"
		componentdir1.path = packagedir1.path + componentdir1.name + "/"
		
		var returnMap = (<CPPModel, CPPDirectory>newHashMap)
		returnMap.put(cppModel, rootdir)
		returnMap
	}
	
}