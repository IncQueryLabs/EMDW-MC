package com.incquerylabs.emdw.cpp.codegeneration.test.makefiles

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	MakefileTest
])
@RunWith(Suite)
class MakefileTestSuite {}

class MakefileTest extends MakeBaseTest<State, CPPModel> {
	
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createPackage("RootPackage")
		val xtComponent = xtPackage.createXtComponent("Component")
		
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		cppPackage.createCPPComponentWithDirectoriesAndFiles(xtComponent)
		
		cppModel
	}
	
	override protected assertResult(CPPModel result, CPPModel cppObject) {
		assertNotNull(makefileContent)
		assertTrue(makefileContent.toString.contains("dir := 	$(d)/Runtime"))
		assertTrue(makefileContent.toString.contains("dir := 	$(d)/"+result.headerDir.name))
		assertTrue(makefileContent.toString.contains("rm -f $(OBJECTS) $(BINARY)"))
	}
	
}