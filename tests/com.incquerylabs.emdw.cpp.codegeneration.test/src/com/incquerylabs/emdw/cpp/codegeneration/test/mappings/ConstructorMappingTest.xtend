package com.incquerylabs.emdw.cpp.codegeneration.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.CPPCodeGenerationWrapper
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class ConstructorMappingTest extends TransformationTest<State, CPPClass> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createPackage("RootPackage")
		val xtComponent = xtPackage.createXtComponent("Component")
		val xtClass = xtComponent.createXtClass("TEST_CLASS")
		val xtTypeVoid = xtPackage.createTypeDefinition("VoidDef").createPrimitiveType("Void")
		val xtConstructor = xtClass.createOperation(VisibilityKind.PUBLIC, false, xtTypeVoid, "TEST_CLASS", "// body comment")
		
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val cppComponent = createCPPComponentWithDefaultDirectories(cppPackage, xtComponent, null, null, null, null)
		val cppClassHeader = createCPPHeaderFile(cppComponent.headerDirectory)
		val cppClassBody = createCPPBodyFile(cppComponent.bodyDirectory)
		val cppClass = createCPPClass(cppComponent, xtClass, cppClassHeader, cppClassBody)
		createCPPOperation(cppClass, xtConstructor)
		
		cppClass
	}
	
	override protected assertResult(CPPModel result, CPPClass cppObject) {
		val wrapper = xform as CPPCodeGenerationWrapper

		val files = wrapper.codegen.generatedCPPSourceFiles
		val classBody = files.get(cppObject.bodyFile).toString
		assertTrue(classBody.contains("TEST_CLASS::TEST_CLASS()"))
		
	}
	
}