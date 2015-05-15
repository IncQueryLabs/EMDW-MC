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
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind

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
		val xtOp = xtClass.createOperation(VisibilityKind.PUBLIC, false, xtType, "myOp", "PSEUDO_CODE", xtPar)
		
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val cppComponent = createCPPComponent(cppPackage, xtComponent, null, null, null, null)
		val cppClass = createCPPClass(cppComponent, xtClass, null, null)
		val cppOp = createCPPOperation(cppClass, xtOp)
		
		cppClass
	}
	
	override protected assertResult(CPPModel result, CPPClass cppObject) {
	}
	
}