package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAction
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static com.incquerylabs.emdw.testing.common.utils.ModelUtil.*
import static org.junit.Assert.*

@SuiteClasses(#[
	OperationMappingTest,
	DestructorMappingTest,
	AbstractOperationMappingTest
])
@RunWith(Suite)
class OperationMappingTestSuite {}

class OperationMappingTest extends TransformationTest<org.eclipse.uml2.uml.Operation, Operation> {

	override protected createUmlObject(Model umlRoot) {
		umlRoot.createOperation(TEST_SIDE_EFFECT_1, createComponentInModel(umlRoot))
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTClass).head.operations
	}

	override protected checkXtumlrtObject(RootMapping mapping, org.eclipse.uml2.uml.Operation umlObject, Operation xtumlrtObject) {
		assertEquals(TEST_SIDE_EFFECT_1, (xtumlrtObject.body as XTAction).body.head.source)
		assertEquals(mapping.xtumlrtRoot.entities.filter(XTComponent).head, xtumlrtObject.returnType.type)
		assertEquals(umlObject.static, xtumlrtObject.static)
		assertFalse("Operation is set to abstract by default", xtumlrtObject.isAbstract)
		assertEquals(umlObject.visibility.transform, xtumlrtObject.visibility)
	}

}

class AbstractOperationMappingTest extends TransformationTest<org.eclipse.uml2.uml.Operation, Operation> {

	override protected createUmlObject(Model umlRoot) {
		umlRoot.createAbstractOperation(umlRoot.createComponentInModel)
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTClass).head.operations
	}

	override protected checkXtumlrtObject(RootMapping mapping, org.eclipse.uml2.uml.Operation umlObject, Operation xtumlrtObject) {
		assertTrue("Operation is not set to abstract", xtumlrtObject.isAbstract)
		assertNull("Abstract operation has body", xtumlrtObject.body)
		assertEquals("Abstract operation return type is not set correctly",
			mapping.xtumlrtRoot.entities.filter(XTComponent).head,
			xtumlrtObject.returnType.type
		)
		assertEquals("Abstract operation visibility is not set correctly", umlObject.visibility.transform, xtumlrtObject.visibility)
	}

}

class DestructorMappingTest extends TransformationTest<org.eclipse.uml2.uml.Operation, Operation> {

	override protected createUmlObject(Model umlRoot) {
		umlRoot.createDestructor(TEST_SIDE_EFFECT_1)
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTClass).head.operations
	}

	override protected checkXtumlrtObject(RootMapping mapping, org.eclipse.uml2.uml.Operation umlObject, Operation xtumlrtObject) {
		assertEquals(TEST_SIDE_EFFECT_1, (xtumlrtObject.body as XTAction).body.head.source)
		assertEquals(umlObject.name, xtumlrtObject.name)
		assertEquals(umlObject.static, xtumlrtObject.static) 
		assertEquals(umlObject.visibility.transform, xtumlrtObject.visibility)
	}

}
