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

import static extension com.incquerylabs.emdw.testing.common.utils.CppUtil.*
import static extension com.incquerylabs.emdw.testing.common.utils.XtumlUtil.*

// TODO static, visibility, default

@SuiteClasses(#[
	AttributeMappingTest
])
@RunWith(Suite)
class AttributeMappingTestSuite {}

class AttributeMappingTest extends TransformationTest<State, CPPClass> {
	
	override protected prepareCppModel(CPPModel cppModel) {
		
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createPackage("RootPackage")
		val xtComponent = xtPackage.createXtComponent("Component")
		val xtClass = xtComponent.createXtClass("TEST")
		val xtType = xtmodel.findPrimitiveType("Boolean")
		val xtAttr = xtClass.createSingleAttribute(xtType, VisibilityKind.PUBLIC, false, "myBool")
		val xtAttr2 = xtClass.createListAttribute(xtType, VisibilityKind.PUBLIC, true, "myBools")
		
		val cppPackage = cppModel.createCPPPackage(xtPackage)
		val cppComponent = cppPackage.createCPPComponentWithDirectoriesAndFiles(xtComponent)
		val cppClassHeader = cppComponent.headerDirectory.createCPPHeaderFile
		val cppClassBody = cppComponent.bodyDirectory.createCPPBodyFile
		val cppClass = cppComponent.createCPPClass(xtClass, cppClassHeader, cppClassBody)
		cppClass.createCPPAttribute(xtAttr)
		val cppAttr2 = cppClass.createCPPAttribute(xtAttr2)
		val cppType = cppModel.findCPPBasicType(xtType)
		cppAttr2.createCPPSequence(cppType, false, true)
		
		cppClass
	}
	
	override protected assertResult(CPPModel result, CPPClass cppObject) {
		val files = util.cppCodeGeneration.generatedCPPSourceFiles
		val classHeader = files.get(cppObject.headerFile).toString
		assertTrue(classHeader.contains("bool myBool;"))
		assertTrue(classHeader.contains("set< bool > myBools;"))
		
	}
	
}
