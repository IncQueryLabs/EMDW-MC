package com.incquerylabs.emdw.cpp.codegeneration.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTestUtil.*
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.CPPCodeGenerationWrapper

// TODO static, visibility, param directions

@RunWith(Parameterized)
class OperationMappingTest extends TransformationTest<State, CPPClass> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createPackage("RootPackage")
		val xtComponent = xtPackage.createXtComponent("Component")
		val xtClass = xtComponent.createXtClass("TEST")
		val xtType = xtPackage.createTypeDefinition("BooleanDef").createPrimitiveType("Boolean")
		val xtPar = createParameter(xtType, "myParam", DirectionKind.IN)
		val xtPar2 = createParameter(xtType, "myParam2", DirectionKind.IN)
		xtPar2.upperBound = 2;
		val xtOp = xtClass.createOperation(VisibilityKind.PUBLIC, false, xtType, "myOp", "PSEUDO_CODE", xtPar, xtPar2)
		
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val cppComponent = createCPPComponentWithDefaultDirectories(cppPackage, xtComponent, null, null, null, null)
		val cppClassHeader = createCPPHeaderFile(cppComponent.headerDirectory)
		val cppClassBody = createCPPBodyFile(cppComponent.bodyDirectory)
		val cppClass = createCPPClass(cppComponent, xtClass, cppClassHeader, cppClassBody)
		val cppOp = createCPPOperation(cppClass, xtOp)
		val cppType = createCPPBasicType(cppPackage, xtType)
		createCPPFormalParameter(cppOp, xtPar, cppType, false)
		createCPPFormalParameter(cppOp, xtPar2, cppType, true)
		
		cppClass
	}
	
	override protected assertResult(CPPModel result, CPPClass cppObject) {
		val wrapper = xform as CPPCodeGenerationWrapper

		val files = wrapper.codegen.generatedCPPSourceFiles
		
		val classHeader = files.get(cppObject.headerFile).toString
		// check operation signature in declaration
		assertTrue(classHeader.contains("TEST::myOp("))
		assertTrue(classHeader.contains("bool myParam"))
		assertTrue(classHeader.contains("set< bool > myParam2"))
		
		val classBody = files.get(cppObject.bodyFile).toString
		// check operation signature in definition
		assertTrue(classBody.contains("TEST::myOp("))
		assertTrue(classBody.contains("bool myParam"))
		assertTrue(classBody.contains("set< bool > myParam2"))
		
	}
	
}