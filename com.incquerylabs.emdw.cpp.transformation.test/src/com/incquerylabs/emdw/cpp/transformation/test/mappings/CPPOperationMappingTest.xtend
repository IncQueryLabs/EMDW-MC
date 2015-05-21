package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*
import com.ericsson.xtumlrt.oopl.cppmodel.CPPFormalParameter

@SuiteClasses(#[
	CPPOperationInClassTest,
	CPPOperationInComponentTest
])
@RunWith(Suite)
class CPPOperationMappingTestSuite {}

@RunWith(Parameterized)
class CPPOperationInClassTest extends MappingBaseTest<XTClass, CPPComponent> {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("Class")
		xtClass.createOperation(VisibilityKind.PUBLIC, false, null,"Op", "Body",createParameter(xtClass,"Param",DirectionKind.IN))
		
		xtClass
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponent(cppPackage, xtComponent, null, null, null, null)
		
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		cppComponent.headerDirectory = rootDir
		cppComponent.bodyDirectory = rootDir
		
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

@RunWith(Parameterized)
class CPPOperationInComponentTest extends MappingBaseTest<XTComponent, CPPComponent> {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("Class")
		component.createOperation(VisibilityKind.PUBLIC, false, null,"Op", "Body",createParameter(xtClass,"Param",DirectionKind.IN))
		
		component
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponent(cppPackage, xtComponent, null, null, null, null)
		
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		cppComponent.headerDirectory = rootDir
		cppComponent.bodyDirectory = rootDir
		
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