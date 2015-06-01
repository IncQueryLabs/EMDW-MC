package com.incquerylabs.emdw.cpp.codegeneration.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTestUtil.*
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind

// TODO static, visibility, default

@RunWith(Parameterized)
class AttributeMappingTest extends TransformationTest<State, CPPClass> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createPackage("RootPackage")
		val xtComponent = xtPackage.createXtComponent("Component")
		val xtClass = xtComponent.createXtClass("TEST")
		val xtType = xtPackage.createTypeDefinition("BooleanDef").createPrimitiveType("Boolean")
		val xtAttr = xtClass.createSingleAttribute(xtType, VisibilityKind.PUBLIC, false, "myBool")
		val xtAttr2 = xtClass.createListAttribute(xtType, VisibilityKind.PUBLIC, true, "myBool")
		
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val cppComponent = createCPPComponent(cppPackage, xtComponent, null, null, null, null)
		val cppClass = createCPPClass(cppComponent, xtClass, null, null)
		val cppAttr = createCPPAttribute(cppClass, xtAttr)
		val cppAttr2 = createCPPAttribute(cppClass, xtAttr2)
		val cppType = createCPPBasicType(cppPackage, xtType)
		createCPPSequence(cppAttr2, cppType)
		
		cppClass
	}
	
	override protected assertResult(CPPModel result, CPPClass cppObject) {
	}
	
}
