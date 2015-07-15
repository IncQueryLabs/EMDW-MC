package com.incquerylabs.emdw.cpp.codegeneration.test.mains

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.junit.runners.Parameterized
import org.junit.runner.RunWith
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTestUtil.*
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent

@RunWith(Parameterized)
class MainGenerationTest extends MainBaseTest<State, CPPComponent> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createPackage("RootPackage")
		val xtComponent = xtPackage.createXtComponent("Component")
		
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val cppComponent = createCPPComponentWithDefaultDirectories(cppPackage, xtComponent)
		
		cppComponent
	}
	
	override protected assertResult(CPPModel result, CPPComponent cppObject) {
		assertNotNull(mainContent)
		
		assertTrue(mainContent.toString.contains('''#include "«cppObject.definitionHeaderFile.generationPath»"'''))
		
		assertTrue(mainContent.toString.contains("int main(int , char **)"))
	}
	
}