package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPFormalParameter
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.junit.Ignore

@SuiteClasses(#[
	CPPFormalParameterBasicTypeTest,
	CPPFormalParameterBasicTypeSequenceTest,
	CPPFormalParameterClassTypeTest,
	CPPFormalParameterClassTypeSequenceTest
])
@RunWith(Suite)
class CPPFormalParameterMappingTestSuite {}

@RunWith(Parameterized)
class CPPFormalParameterBasicTypeTest extends SingleComponentTransformTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected clearXtUmlElement(XTComponent xtComponent) {
		val xtClass = xtComponent.entities.filter(XTClass).head
		xtClass.operations.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val cppClass = cppComponent.subElements.filter(CPPClass).head
		val cppOp = cppClass.subElements.filter(CPPOperation)
		assertEquals(0,cppOp.size)
	}
	
	override protected prepareXtUmlModel(Model xtModel) {
		val pack = xtModel.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("Class")
		val xtTypeDef = pack.createTypeDefinition("td")
		val xtType = createPrimitiveType(xtTypeDef, "primitiveType")
		val xtParam = createParameter(xtType,"Param",DirectionKind.IN)
		xtClass.createOperation(VisibilityKind.PUBLIC, false, null,"Op", "Body", xtParam)
		
		component
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		val rootDir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponentWithDirectoriesAndFiles(cppPackage, xtComponent, rootDir)
		createCPPBasicType(cppPackage, xtPackage.typeDefinitions.head.type)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val xtClass = xtComponent.entities.filter(XTClass).head
		val xtOperations = xtClass.operations
		val cppClass = cppComponent.subElements.filter(CPPClass).head
		val cppOperations = cppClass.subElements.filter(CPPOperation)
		assertEquals(xtOperations.size, cppOperations.size)
		cppOperations.forEach[
			assertEquals(commonOperation.parameters.size, subElements.filter(CPPFormalParameter).size)
			subElements.filter(CPPFormalParameter).forEach[
				assertNotNull(ooplNameProvider)
				assertNotNull(commonParameter)
				assertNotNull("Type of parameter is not correctly converted", type)
				assertNotNull("Type of parameter is not correctly converted", type.commonType)
			]
		]
	}
	
}

@RunWith(Parameterized)
class CPPFormalParameterBasicTypeSequenceTest extends SingleComponentTransformTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected clearXtUmlElement(XTComponent xtComponent) {
		val xtClass = xtComponent.entities.filter(XTClass).head
		xtClass.operations.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val cppClass = cppComponent.subElements.filter(CPPClass).head
		val cppOp = cppClass.subElements.filter(CPPOperation)
		assertEquals(0,cppOp.size)
	}
	
	override protected prepareXtUmlModel(Model xtModel) {
		val pack = xtModel.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("Class")
		val xtTypeDef = pack.createTypeDefinition("td")
		val xtType = createPrimitiveType(xtTypeDef, "primitiveType")
		val xtParam = createParameter(xtType,"Param",DirectionKind.IN) => [
			upperBound = 5
		]
		xtClass.createOperation(VisibilityKind.PUBLIC, false, null,"Op", "Body", xtParam)
		
		component
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		val rootDir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponentWithDirectoriesAndFiles(cppPackage, xtComponent, rootDir)
		createCPPBasicType(cppPackage, xtPackage.typeDefinitions.head.type)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val xtClass = xtComponent.entities.filter(XTClass).head
		val xtOperations = xtClass.operations
		val cppClass = cppComponent.subElements.filter(CPPClass).head
		val cppOperations = cppClass.subElements.filter(CPPOperation)
		assertEquals(xtOperations.size, cppOperations.size)
		cppOperations.forEach[
			assertEquals(commonOperation.parameters.size, subElements.filter(CPPFormalParameter).size)
			subElements.filter(CPPFormalParameter).forEach[
				assertNotNull(ooplNameProvider)
				assertNotNull(commonParameter)
				assertNotNull("Type of parameter is not correctly converted", type)
				assertNotNull("Type of parameter is not correctly converted", unnamedSequenceType)
				assertNotNull("Type of parameter is not correctly converted", unnamedSequenceType.elementType)
			]
		]
	}
}

@Ignore("Not implemented")
@RunWith(Parameterized)
class CPPFormalParameterClassTypeTest extends SingleComponentTransformTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected clearXtUmlElement(XTComponent xtComponent) {
		val xtClass = xtComponent.entities.filter(XTClass).head
		xtClass.operations.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val cppClass = cppComponent.subElements.filter(CPPClass).head
		val cppOp = cppClass.subElements.filter(CPPOperation)
		assertEquals(0,cppOp.size)
	}
	
	override protected prepareXtUmlModel(Model xtModel) {
		val pack = xtModel.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("Class")
		val xtClass2 = component.createXtClass("Class2")
		val xtParam = createParameter(xtClass2,"Param",DirectionKind.IN)
		xtClass.createOperation(VisibilityKind.PUBLIC, false, null,"Op", "Body", xtParam)
		
		component
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		val rootDir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponentWithDirectoriesAndFiles(cppPackage, xtComponent, rootDir)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val xtClass = xtComponent.entities.filter(XTClass).head
		val xtOperations = xtClass.operations
		val cppClass = cppComponent.subElements.filter(CPPClass).head
		val cppOperations = cppClass.subElements.filter(CPPOperation)
		assertEquals(xtOperations.size, cppOperations.size)
		cppOperations.forEach[
			assertEquals(commonOperation.parameters.size, subElements.filter(CPPFormalParameter).size)
			subElements.filter(CPPFormalParameter).forEach[
				assertNotNull(ooplNameProvider)
				assertNotNull(commonParameter)
				assertNotNull("Type of parameter is not correctly converted", type)
				assertNotNull("Type of parameter is not correctly converted", type.commonType)
			]
		]
	}
}

@Ignore("Not implemented")
@RunWith(Parameterized)
class CPPFormalParameterClassTypeSequenceTest extends SingleComponentTransformTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected clearXtUmlElement(XTComponent xtComponent) {
		val xtClass = xtComponent.entities.filter(XTClass).head
		xtClass.operations.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val cppClass = cppComponent.subElements.filter(CPPClass).head
		val cppOp = cppClass.subElements.filter(CPPOperation)
		assertEquals(0,cppOp.size)
	}
	
	override protected prepareXtUmlModel(Model xtModel) {
		val pack = xtModel.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("Class")
		val xtClass2 = component.createXtClass("Class2")
		val xtParam = createParameter(xtClass2,"Param",DirectionKind.IN) => [
			upperBound = 5
		]
		xtClass.createOperation(VisibilityKind.PUBLIC, false, null,"Op", "Body", xtParam)
		
		component
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		val rootDir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponentWithDirectoriesAndFiles(cppPackage, xtComponent, rootDir)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val xtClass = xtComponent.entities.filter(XTClass).head
		val xtOperations = xtClass.operations
		val cppClass = cppComponent.subElements.filter(CPPClass).head
		val cppOperations = cppClass.subElements.filter(CPPOperation)
		assertEquals(xtOperations.size, cppOperations.size)
		cppOperations.forEach[
			assertEquals(commonOperation.parameters.size, subElements.filter(CPPFormalParameter).size)
			subElements.filter(CPPFormalParameter).forEach[
				assertNotNull(ooplNameProvider)
				assertNotNull(commonParameter)
				assertNotNull("Type of parameter is not correctly converted", type)
				assertNotNull("Type of parameter is not correctly converted", unnamedSequenceType)
				assertNotNull("Type of parameter is not correctly converted", unnamedSequenceType.elementType)
			]
		]
	}
}
