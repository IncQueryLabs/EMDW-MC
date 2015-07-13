package com.incquerylabs.emdw.cpp.codegeneration.test.makefiles

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class MakefileTest extends MakeBaseTest<State, CPPModel> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createPackage("RootPackage")
		val xtComponent = xtPackage.createXtComponent("Component")
		
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		createCPPComponentWithDefaultDirectories(cppPackage, xtComponent)
		
		cppModel
	}
	
	override protected assertResult(CPPModel result, CPPModel cppObject) {
		assertNotNull(makefileContent)
		assertTrue(makefileContent.toString.contains("dir := 	$(d)/Runtime"))
		assertTrue(makefileContent.toString.contains("dir := 	$(d)/"+result.headerDir.name))
		assertTrue(makefileContent.toString.contains("rm -f $(OBJECTS) $(BINARY)"))
	}
	
}