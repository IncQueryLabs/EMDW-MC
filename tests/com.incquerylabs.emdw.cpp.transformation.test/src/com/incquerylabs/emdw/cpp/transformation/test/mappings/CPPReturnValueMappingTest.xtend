package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPBasicType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPReturnValue
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
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

@SuiteClasses(#[
	CPPReturnValueTest
])
@RunWith(Suite)
class CPPReturnValueMappingTestSuite {}

@RunWith(Parameterized)
class CPPReturnValueTest extends SingleComponentTransformTest {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model xtModel) {
		val pack = xtModel.createPackage("RootPackage")
		val xtComponent = pack.createXtComponent("Component")
		val xtClass = xtComponent.createXtClass("Class")
		val xtTypeDef = pack.createTypeDefinition("td")
		val xtType = createPrimitiveType(xtTypeDef, "primitiveType")
		
		xtClass.createOperation(VisibilityKind.PUBLIC, false, xtType,"Op", "Body")
		
		xtComponent
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponentWithDirectoriesAndFiles(cppPackage, xtComponent, rootDir)
		
		cppPackage.createCPPBasicType(xtPackage.typeDefinitions.head.type)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTComponent xtObject, CPPComponent cppObject) {
		val xtOperation = xtObject.entities.filter(XTClass).head.operations.head
		val xtReturnType = xtOperation.returnType
		val cppClass = cppObject.subElements.filter(CPPClass).head
		val cppOperation = cppClass.subElements.filter(CPPOperation).head
		val cppPackage = cppObject.eContainer as CPPPackage
		val cppBasicType = cppPackage .subElements.filter(CPPBasicType).head
		val cppReturnValue = cppOperation.subElements.filter(CPPReturnValue).head
		
		assertNotNull("Return value is not created", cppReturnValue)
		assertEquals("CommonTypedMultiplicityElement of return value is incorrect", xtReturnType, cppReturnValue.commonTypedMultiplicityElement)
		assertEquals("Type of CPPReturnValue is incorrect", cppBasicType, cppReturnValue.type)
	}
	
	override protected clearXtUmlElement(XTComponent xtObject) {
		val xtClass = xtObject.entities.filter(XTClass).head
		xtClass.operations.head.returnType = null
	}
	
	override protected assertClear(Model input, CPPModel result, XTComponent xtObject, CPPComponent cppObject) {
		val cppClass = cppObject.subElements.filter(CPPClass).head
		val cppOperation = cppClass.subElements.filter(CPPOperation).head
		val cppReturnValue = cppOperation.subElements.filter(CPPReturnValue).head
		assertNull("Return value is not deleted", cppReturnValue)
	}
}
