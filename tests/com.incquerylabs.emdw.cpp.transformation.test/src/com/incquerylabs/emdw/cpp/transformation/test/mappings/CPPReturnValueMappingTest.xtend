package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPBasicType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReference
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
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefSimpleCollection

@SuiteClasses(#[
	CPPReturnValueSingleBasicTypeTest,
	CPPReturnValueBasicTypeSequenceTest,
	CPPReturnValueSingleClassTypeTest,
	CPPReturnValueClassCollectionTypeTest
])
@RunWith(Suite)
class CPPReturnValueMappingTestSuite {}

@RunWith(Parameterized)
class CPPReturnValueSingleBasicTypeTest extends SingleComponentTransformTest {
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

@RunWith(Parameterized)
class CPPReturnValueBasicTypeSequenceTest extends SingleComponentTransformTest {
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
		
		val xtOperation = xtClass.createOperation(VisibilityKind.PUBLIC, false, xtType,"Op", "Body")
		xtOperation.returnType.lowerBound = 0
		xtOperation.returnType.upperBound = -1
		
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
		val cppSequence = cppReturnValue.unnamedSequenceType
		assertNotNull("CPPSequence is not created", cppSequence)
		assertEquals("Type of CPPReturnValue is incorrect", cppSequence, cppReturnValue.type)
		assertEquals("Type of CPPSequence is incorrect", cppBasicType, cppSequence.elementType)
		assertNotNull("CPPSequence implementation is not set", cppSequence.implementation)
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

@RunWith(Parameterized)
class CPPReturnValueSingleClassTypeTest extends SingleComponentTransformTest {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model xtModel) {
		val pack = xtModel.createPackage("RootPackage")
		val xtComponent = pack.createXtComponent("Component")
		val xtClass = xtComponent.createXtClass("Class")
		
		val xtOperation = xtClass.createOperation(VisibilityKind.PUBLIC, false, xtClass,"Op", "Body")
		xtOperation.returnType.lowerBound = 1
		xtOperation.returnType.upperBound = 1
		
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
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTComponent xtObject, CPPComponent cppObject) {
		val xtClass = xtObject.entities.filter(XTClass).head
		val xtOperation = xtClass.operations.head
		val xtReturnType = xtOperation.returnType
		val cppClass = cppObject.subElements.filter(CPPClass).head
		val cppOperation = cppClass.subElements.filter(CPPOperation).head
		val cppReturnValue = cppOperation.subElements.filter(CPPReturnValue).head
		
		assertNotNull("Return value is not created", cppReturnValue)
		assertEquals("CommonTypedMultiplicityElement of return value is incorrect", xtReturnType, cppReturnValue.commonTypedMultiplicityElement)
		val cppClassReference = cppReturnValue.subElements.filter(CPPClassReference).head
		assertNotNull("CPPClassReference is not created", cppClassReference)
		assertEquals("Type of CPPReturnValue is incorrect", cppClassReference, cppReturnValue.type)
		assertEquals("Common type of CPPClassReference is incorrect", xtClass, cppClassReference.commonType)
		assertEquals("Type of CPPClassReference is incorrect", cppClass, cppClassReference.ooplClass)
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

@RunWith(Parameterized)
class CPPReturnValueClassCollectionTypeTest extends SingleComponentTransformTest {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model xtModel) {
		val pack = xtModel.createPackage("RootPackage")
		val xtComponent = pack.createXtComponent("Component")
		val xtClass = xtComponent.createXtClass("Class")
		
		val xtOperation = xtClass.createOperation(VisibilityKind.PUBLIC, false, xtClass,"Op", "Body")
		xtOperation.returnType.lowerBound = 0
		xtOperation.returnType.upperBound = -1
		
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
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTComponent xtObject, CPPComponent cppObject) {
		val xtClass = xtObject.entities.filter(XTClass).head
		val xtOperation = xtClass.operations.head
		val xtReturnType = xtOperation.returnType
		val cppClass = cppObject.subElements.filter(CPPClass).head
		val cppOperation = cppClass.subElements.filter(CPPOperation).head
		val cppReturnValue = cppOperation.subElements.filter(CPPReturnValue).head
		
		assertNotNull("Return value is not created", cppReturnValue)
		assertEquals("CommonTypedMultiplicityElement of return value is incorrect", xtReturnType, cppReturnValue.commonTypedMultiplicityElement)
		val cppClassReferenceCollection = cppReturnValue.subElements.filter(CPPClassRefSimpleCollection).head
		assertNotNull("CPPClassRefSimpleCollection is not created", cppClassReferenceCollection)
		assertEquals("Type of CPPReturnValue is incorrect", cppClassReferenceCollection, cppReturnValue.type)
		assertEquals("Common type of CPPClassRefSimpleCollection is incorrect", xtClass, cppClassReferenceCollection.commonType)
		assertEquals("Type of CPPClassRefSimpleCollection is incorrect", cppClass, cppClassReferenceCollection.ooplClass)
		assertNotNull("CPPClassRefSimpleCollection implementation is not set", cppClassReferenceCollection.implementation)
		
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
