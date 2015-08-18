package com.incquerylabs.emdw.cpp.codegeneration.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.CPPCodeGenerationWrapper
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class GeneralizationMappingTest extends TransformationTest<CPPComponent, CPPComponent> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		
		// Prepare xtUML model
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createPackage("RootPackage")
		val xtComponent = xtPackage.createXtComponent("Component")
		val xtBooleanType = xtmodel.findPrimitiveType("Boolean")
		val xtIntType = xtmodel.findPrimitiveType("Integer")
		
		val xtBaseClass = xtComponent.createXtClass("BaseClass")
		val xtDerivedClass = xtComponent.createXtClass("DerivedClass")
		val xtParam1 = createParameter(xtBooleanType, "FunctionParamBool", DirectionKind.IN)
		val xtBaseVirtualOperation = xtBaseClass.createOperation(VisibilityKind.PUBLIC, false, xtBooleanType, "myVirtualFunction", "// this is the virtual function", xtParam1)
		
		val xtBaseVirtualReturnType = createTypedMultiplicityElement(xtBooleanType, 1, 1, false, false)
		xtBaseVirtualOperation.returnType = xtBaseVirtualReturnType
		
		val xtParam2 = createParameter(xtBooleanType, "ParamBool", DirectionKind.IN)
		val xtParam3 = createParameter(xtIntType, "ParamInt", DirectionKind.IN)
		val xtBaseConstructor1 = xtBaseClass.createOperation(VisibilityKind.PUBLIC, false, xtBooleanType, xtBaseClass.name, "// this is a constructor", xtParam2, xtParam3)
		
		val xtParam4 = createParameter(xtBooleanType, "ParamBool", DirectionKind.IN)
		val xtBaseConstructor2 = xtBaseClass.createOperation(VisibilityKind.PUBLIC, false, xtBooleanType, xtBaseClass.name, "// this is another constructor", xtParam4)
		
		val generalization = xtDerivedClass.createGeneralization(xtBaseClass)
		val xtParam1d = createParameter(xtBooleanType, "FunctionParamBool", DirectionKind.IN)
		val xtDerivedVirtualOperation = xtDerivedClass.createOperation(VisibilityKind.PUBLIC, false, xtBooleanType, "myVirtualFunction", "// this is the virtual function in the derived class", xtParam1d)
		val xtDerivedVirtualReturnType = createTypedMultiplicityElement(xtBooleanType, 1, 1, false, false)
		xtDerivedVirtualOperation.returnType = xtDerivedVirtualReturnType
		
		val xtParam2d = createParameter(xtBooleanType, "ParamBool", DirectionKind.IN)
		val xtParam3d = createParameter(xtIntType, "NotTheSameParamInt", DirectionKind.IN)
		val xtDerivedConstructor1 = xtDerivedClass.createOperation(VisibilityKind.PUBLIC, false, xtBooleanType, xtDerivedClass.name, "// this is a constructor", xtParam2d, xtParam3d)
		
		// Prepare cppmodel
		val cppBooleanType = cppModel.findCPPBasicType(xtBooleanType)
		val cppIntType = cppModel.findCPPBasicType(xtIntType)
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val cppComponent = createCPPComponentWithDefaultDirectories(cppPackage, xtComponent)
		val cppClass1Header = createCPPHeaderFile(cppComponent.headerDirectory)
		val cppClass1Body = createCPPBodyFile(cppComponent.bodyDirectory)
		val cppBaseClass = createCPPClass(cppComponent, xtBaseClass, cppClass1Header, cppClass1Body)
		val cppClass2Header = createCPPHeaderFile(cppComponent.headerDirectory)
		val cppClass2Body = createCPPBodyFile(cppComponent.bodyDirectory)
		val cppDerivedClass = createCPPClass(cppComponent, xtDerivedClass, cppClass2Header, cppClass2Body)
		
		val cppBaseVirtualOperation = cppBaseClass.createCPPOperation(xtBaseVirtualOperation)
		cppBaseVirtualOperation.createCPPFormalParameter(xtParam1, null, false)
		cppBaseVirtualOperation.createCPPReturnValue(xtBaseVirtualReturnType)
		val cppBaseConstructor1 = cppBaseClass.createCPPOperation(xtBaseConstructor1)
		cppBaseConstructor1.createCPPFormalParameter(xtParam2, null, false)
		cppBaseConstructor1.createCPPFormalParameter(xtParam3, null, false)
		val cppBaseConstructor2 = cppBaseClass.createCPPOperation(xtBaseConstructor2)
		cppBaseConstructor2.createCPPFormalParameter(xtParam4, null, false)
		
		val cppDerivedVirtualOperation = cppDerivedClass.createCPPOperation(xtDerivedVirtualOperation)
		cppDerivedVirtualOperation.createCPPFormalParameter(xtParam1d, null, false)
		cppDerivedVirtualOperation.createCPPReturnValue(xtDerivedVirtualReturnType)
		val cppDerivedConstructor1 = cppDerivedClass.createCPPOperation(xtDerivedConstructor1)
		cppDerivedConstructor1.createCPPFormalParameter(xtParam2d, null, false)
		cppDerivedConstructor1.createCPPFormalParameter(xtParam3d, null, false)
		
		return cppComponent
	}
	
	override protected assertResult(CPPModel result, CPPComponent cppObject) {
		val wrapper = xform as CPPCodeGenerationWrapper
		val files = wrapper.codegen.generatedCPPSourceFiles
		
		val cppBaseClass = cppObject.subElements.filter(CPPClass).filter[cppName == "BaseClass"].head
		val cppDerivedClass = cppObject.subElements.filter(CPPClass).filter[cppName == "DerivedClass"].head
		
		val baseClassHeader = files.get(cppBaseClass.headerFile).toString
		val derivedClassHeader = files.get(cppDerivedClass.headerFile).toString
		val derivedClassBody = files.get(cppDerivedClass.bodyFile).toString
		
		assertTrue(baseClassHeader.contains("virtual bool myVirtualFunction(bool FunctionParamBool);"))
		assertTrue(derivedClassHeader.contains("class DerivedClass: public ::GeneralizationMappingTest_single::RootPackage::Component::BaseClass {"))
		assertTrue(derivedClassHeader.contains("DerivedClass(bool ParamBool, long NotTheSameParamInt);"))
		assertTrue(derivedClassHeader.contains("bool myVirtualFunction(bool FunctionParamBool);"))
		assertTrue(derivedClassBody.contains("DerivedClass(bool ParamBool, long NotTheSameParamInt): ::GeneralizationMappingTest_single::RootPackage::Component::BaseClass(ParamBool) {"))
	}
}
