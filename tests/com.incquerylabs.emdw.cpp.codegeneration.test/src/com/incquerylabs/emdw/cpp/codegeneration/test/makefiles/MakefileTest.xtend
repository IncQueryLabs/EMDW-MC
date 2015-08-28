package com.incquerylabs.emdw.cpp.codegeneration.test.makefiles

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import org.eclipse.papyrusrt.xtumlrt.common.State

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.testing.common.utils.CppUtil.*
import static extension com.incquerylabs.emdw.testing.common.utils.XtumlUtil.*

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