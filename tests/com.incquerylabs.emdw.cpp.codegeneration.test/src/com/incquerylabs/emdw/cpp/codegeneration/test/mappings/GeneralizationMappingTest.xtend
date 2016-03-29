/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.codegeneration.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	GeneralizationMappingTest
])
@RunWith(Suite)
class GeneralizationMappingTestSuite {}

class GeneralizationMappingTest extends TransformationTest<CPPComponent, CPPComponent> {
	
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
		val xtBaseVirtualOperation = xtBaseClass.createOperation(VisibilityKind.PUBLIC, false, xtBooleanType, "myVirtualFunction", "C++", "// this is the virtual function", xtParam1)
		
		val xtBaseVirtualReturnType = xtBooleanType.createTypedMultiplicityElement(1, 1, false, false)
		xtBaseVirtualOperation.returnType = xtBaseVirtualReturnType
		
		val xtParam2 = createParameter(xtBooleanType, "ParamBool", DirectionKind.IN)
		val xtParam3 = createParameter(xtIntType, "ParamInt", DirectionKind.IN)
		val xtBaseConstructor1 = xtBaseClass.createOperation(VisibilityKind.PUBLIC, false, xtBooleanType, xtBaseClass.name, "C++", "// this is a constructor", xtParam2, xtParam3)
		
		val xtParam4 = createParameter(xtBooleanType, "ParamBool", DirectionKind.IN)
		val xtBaseConstructor2 = xtBaseClass.createOperation(VisibilityKind.PUBLIC, false, xtBooleanType, xtBaseClass.name, "C++", "// this is another constructor", xtParam4)
		
		xtDerivedClass.createGeneralization(xtBaseClass)
		val xtParam1d = createParameter(xtBooleanType, "FunctionParamBool", DirectionKind.IN)
		val xtDerivedVirtualOperation = xtDerivedClass.createOperation(VisibilityKind.PUBLIC, false, xtBooleanType, "myVirtualFunction", "C++", "// this is the virtual function in the derived class", xtParam1d)
		val xtDerivedVirtualReturnType = createTypedMultiplicityElement(xtBooleanType, 1, 1, false, false)
		xtDerivedVirtualOperation.returnType = xtDerivedVirtualReturnType
		
		val xtParam2d = createParameter(xtBooleanType, "ParamBool", DirectionKind.IN)
		val xtParam3d = createParameter(xtIntType, "NotTheSameParamInt", DirectionKind.IN)
		val xtDerivedConstructor1 = xtDerivedClass.createOperation(VisibilityKind.PUBLIC, false, xtBooleanType, xtDerivedClass.name, "C++", "// this is a constructor", xtParam2d, xtParam3d)
		
		// Prepare cppmodel
		val cppPackage = cppModel.createCPPPackage(xtPackage)
		val cppComponent = cppPackage.createCPPComponentWithDirectoriesAndFiles(xtComponent)
		val cppClass1Header = cppComponent.headerDirectory.createCPPHeaderFile
		val cppClass1Body = cppComponent.bodyDirectory.createCPPBodyFile
		val cppBaseClass = cppComponent.createCPPClass(xtBaseClass, cppClass1Header, cppClass1Body)
		val cppClass2Header = cppComponent.headerDirectory.createCPPHeaderFile
		val cppClass2Body = cppComponent.bodyDirectory.createCPPBodyFile
		val cppDerivedClass = cppComponent.createCPPClass(xtDerivedClass, cppClass2Header, cppClass2Body)
		
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
		val files = cppCodeGeneration.generatedCPPSourceFiles
		
		val cppBaseClass = cppObject.subElements.filter(CPPClass).filter[cppName == "BaseClass"].head
		val cppDerivedClass = cppObject.subElements.filter(CPPClass).filter[cppName == "DerivedClass"].head
		
		val baseClassHeader = files.get(cppBaseClass.headerFile).toString
		val derivedClassHeader = files.get(cppDerivedClass.headerFile).toString
		val derivedClassBody = files.get(cppDerivedClass.bodyFile).toString
		
		assertTrue(baseClassHeader.contains("virtual bool myVirtualFunction(bool FunctionParamBool);"))
		assertTrue(derivedClassHeader.contains('''class DerivedClass: public ::«testId»::RootPackage::Component::BaseClass {'''))
		assertTrue(derivedClassHeader.contains("DerivedClass(bool ParamBool, long NotTheSameParamInt);"))
		assertTrue(derivedClassHeader.contains("bool myVirtualFunction(bool FunctionParamBool);"))
		assertTrue(derivedClassBody.contains('''DerivedClass(bool ParamBool, long NotTheSameParamInt): ::«testId»::RootPackage::Component::BaseClass(ParamBool) {'''))
	}
}
