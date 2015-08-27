package com.incquerylabs.emdw.cpp.codegeneration.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.testing.common.utils.CppUtil.*
import static extension com.incquerylabs.emdw.testing.common.utils.XtumlUtil.*

class ConstructorMappingTest extends TransformationTest<State, CPPClass> {
	
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createPackage("RootPackage")
		val xtComponent = xtPackage.createXtComponent("Component")
		val xtClass = xtComponent.createXtClass("TEST_CLASS")
		val xtTypeVoid = xtPackage.createTypeDefinition("VoidDef").createPrimitiveType("Void")
		val xtConstructor = xtClass.createOperation(VisibilityKind.PUBLIC, false, xtTypeVoid, "TEST_CLASS", "// body comment")
		
		val cppPackage = cppModel.createCPPPackage(xtPackage)
		val cppComponent = cppPackage.createCPPComponentWithDirectoriesAndFiles(xtComponent)
		val cppClassHeader = cppComponent.headerDirectory.createCPPHeaderFile
		val cppClassBody = cppComponent.bodyDirectory.createCPPBodyFile
		val cppClass = cppComponent.createCPPClass(xtClass, cppClassHeader, cppClassBody)
		cppClass.createCPPOperation(xtConstructor)
		
		cppClass
	}
	
	override protected assertResult(CPPModel result, CPPClass cppObject) {
		val files = util.cppCodeGeneration.generatedCPPSourceFiles
		val classBody = files.get(cppObject.bodyFile).toString
		assertTrue(classBody.contains("TEST_CLASS::TEST_CLASS()"))
		
	}
	
}