package com.incquerylabs.emdw.cpp.codegeneration.test.mains

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import org.eclipse.papyrusrt.xtumlrt.common.State

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.testing.common.utils.CppUtil.*
import static extension com.incquerylabs.emdw.testing.common.utils.XtumlUtil.*

class MainGenerationTest extends MainBaseTest<State, CPPComponent> {
	
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createPackage("RootPackage")
		val xtComponent = xtPackage.createXtComponent("Component")
		
		val cppPackage = cppModel.createCPPPackage(xtPackage)
		val cppComponent = cppPackage.createCPPComponentWithDirectoriesAndFiles(xtComponent)
		
		cppComponent
	}
	
	override protected assertResult(CPPModel result, CPPComponent cppObject) {
		assertNotNull(mainContent)
		
		assertTrue(mainContent.toString.contains('''#include "«cppObject.definitionHeaderFile.generationPath»"'''))
		
		assertTrue(mainContent.toString.contains("int main(int , char **)"))
	}
	
}