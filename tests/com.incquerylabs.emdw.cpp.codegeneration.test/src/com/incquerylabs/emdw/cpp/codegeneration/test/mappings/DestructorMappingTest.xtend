package com.incquerylabs.emdw.cpp.codegeneration.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	DestructorMappingTest
])
@RunWith(Suite)
class DestructorMappingTestSuite {}

class DestructorMappingTest extends TransformationTest<State, CPPClass> {
	
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createPackage("RootPackage")
		val xtComponent = xtPackage.createXtComponent("Component")
		val xtClass = xtComponent.createXtClass("TEST_CLASS")
		val xtTypeVoid = xtPackage.createTypeDefinition("VoidDef").createPrimitiveType("Void")
		val xtDestructor = xtClass.createOperation(VisibilityKind.PUBLIC, false, xtTypeVoid, "destroy", "C++", "// body comment")
		
		val cppPackage = cppModel.createCPPPackage(xtPackage)
		val cppComponent = cppPackage.createCPPComponentWithDirectoriesAndFiles(xtComponent)
		val cppClassHeader = cppComponent.headerDirectory.createCPPHeaderFile
		val cppClassBody = cppComponent.bodyDirectory.createCPPBodyFile
		val cppClass = cppComponent.createCPPClass(xtClass, cppClassHeader, cppClassBody)
		cppClass.createCPPOperation(xtDestructor)
		
		cppClass
	}
	
	override protected assertResult(CPPModel result, CPPClass cppObject) {
		val files = cppCodeGeneration.generatedCPPSourceFiles
		val classBody = files.get(cppObject.bodyFile).toString
		// check destructor in definition
		assertTrue(classBody.contains("TEST_CLASS::~TEST_CLASS()"))
		
	}
	
}