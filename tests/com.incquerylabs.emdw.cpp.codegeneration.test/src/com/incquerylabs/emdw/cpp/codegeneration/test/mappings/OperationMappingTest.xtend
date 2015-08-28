package com.incquerylabs.emdw.cpp.codegeneration.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.testing.common.utils.CppUtil.*
import static extension com.incquerylabs.emdw.testing.common.utils.XtumlUtil.*

// TODO static, visibility, param directions

class OperationMappingTest extends TransformationTest<State, CPPClass> {
	
	override protected prepareCppModel(CPPModel cppModel) {
		
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createPackage("RootPackage")
		val xtComponent = xtPackage.createXtComponent("Component")
		val xtClass = xtComponent.createXtClass("TEST")
		val xtType = xtPackage.findPrimitiveType("Boolean")
		val xtPar = createParameter(xtType, "myParam", DirectionKind.IN)
		val xtPar2 = createParameter(xtType, "myParam2", DirectionKind.IN)
		xtPar2.upperBound = 2;
		val xtOp = xtClass.createOperation(VisibilityKind.PUBLIC, false, xtType, "myOp", "PSEUDO_CODE", xtPar, xtPar2)
		
		val cppPackage = cppModel.createCPPPackage(xtPackage)
		val cppComponent = cppPackage.createCPPComponentWithDirectoriesAndFiles(xtComponent)
		val cppClassHeader = cppComponent.headerDirectory.createCPPHeaderFile
		val cppClassBody = cppComponent.bodyDirectory.createCPPBodyFile
		val cppClass = cppComponent.createCPPClass(xtClass, cppClassHeader, cppClassBody)
		val cppOp = cppClass.createCPPOperation(xtOp)
		val cppType = cppModel.findCPPBasicType(xtType)
		cppOp.createCPPFormalParameter(xtPar, cppType, false)
		cppOp.createCPPFormalParameter(xtPar2, cppType, true)
		
		cppClass
	}
	
	override protected assertResult(CPPModel result, CPPClass cppObject) {
		val files = util.cppCodeGeneration.generatedCPPSourceFiles
		
		val classHeader = files.get(cppObject.headerFile).toString
		// check operation signature in declaration
		assertTrue(classHeader.contains("myOp("))
		assertTrue(classHeader.contains("bool myParam"))
		assertTrue(classHeader.contains("::std::set< bool > myParam2"))
		
		val classBody = files.get(cppObject.bodyFile).toString
		// check operation signature in definition
		assertTrue(classBody.contains("TEST::myOp)("))
		assertTrue(classBody.contains("bool myParam"))
		assertTrue(classBody.contains("set< bool > myParam2"))
		
	}
	
}