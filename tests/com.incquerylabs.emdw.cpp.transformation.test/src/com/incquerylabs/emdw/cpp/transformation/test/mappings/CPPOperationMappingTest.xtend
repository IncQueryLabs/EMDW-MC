package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPFormalParameter
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CPPOperationInClassTest,
	CPPOperationInComponentTest
])
@RunWith(Suite)
class CPPOperationMappingTestSuite {}

class CPPOperationInClassTest extends MappingBaseTest<XTClass, CPPComponent> {
	CPPDirectory rootDir;
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("Class")
		val xtTypeDef = pack.createTypeDefinition("td")
		val xtType = createPrimitiveType(xtTypeDef, "primitiveType")
		val xtParam = createParameter(xtType,"Param",DirectionKind.IN) => [
			upperBound = 5
		]
		xtClass.createOperation(VisibilityKind.PUBLIC, false, null,"Op", "C++", "Body",xtParam)
		
		xtClass
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		rootDir = cppModel.headerDir
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponentWithDirectoriesAndFiles(cppPackage, xtComponent, rootDir)
		
		createCPPBasicType(cppPackage, xtPackage.typeDefinitions.head.type)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTClass xtObject, CPPComponent cppObject) {
		val xtOp = xtObject.operations
		val cppClass = cppObject.subElements.filter(CPPClass).head
		val cppOp = cppClass.subElements.filter(CPPOperation)
		assertEquals(xtOp.size,cppOp.size)
		cppOp.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(commonOperation)
			assertEquals(commonOperation.parameters.size, subElements.filter(CPPFormalParameter).size)
			subElements.filter(CPPFormalParameter).forEach[
				assertNotNull(ooplNameProvider)
				assertNotNull(commonParameter)
				assertNotNull(unnamedSequenceType)
				assertNotNull(unnamedSequenceType.elementType)
			]
		]
	}
	
	override protected clearXtUmlElement(XTClass xtObject) {
		xtObject.operations.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTClass xtObject, CPPComponent cppObject) {
		val cppClass = cppObject.subElements.filter(CPPClass).head
		val cppOp = cppClass.subElements.filter(CPPOperation)
		assertEquals(0,cppOp.size)
	}
	
}

class CPPOperationInComponentTest extends MappingBaseTest<XTComponent, CPPComponent> {
	CPPDirectory rootDir;
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtTypeDef = pack.createTypeDefinition("td")
		val xtType = createPrimitiveType(xtTypeDef, "primitiveType")
		val xtParam = createParameter(xtType,"Param",DirectionKind.IN)
		component.createOperation(VisibilityKind.PUBLIC, false, null,"Op", "C++", "Body", xtParam)
		
		component
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		rootDir = cppModel.headerDir
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponentWithDirectoriesAndFiles(cppPackage, xtComponent, rootDir)
		createCPPBasicType(cppPackage, xtPackage.typeDefinitions.head.type)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTComponent xtObject, CPPComponent cppObject) {
		val xtOp = xtObject.operations
		val cppOp = cppObject.subElements.filter(CPPOperation)
		assertEquals(xtOp.size,cppOp.size)
		cppOp.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(commonOperation)
			assertEquals(commonOperation.parameters.size, subElements.filter(CPPFormalParameter).size)
			subElements.filter(CPPFormalParameter).forEach[
				assertNotNull(ooplNameProvider)
				assertNotNull(commonParameter)
			]
		]
	}
	
	override protected clearXtUmlElement(XTComponent xtObject) {
		xtObject.operations.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTComponent xtObject, CPPComponent cppObject) {
		val cppOp = cppObject.subElements.filter(CPPOperation)
		assertEquals(0,cppOp.size)
	}
	
}