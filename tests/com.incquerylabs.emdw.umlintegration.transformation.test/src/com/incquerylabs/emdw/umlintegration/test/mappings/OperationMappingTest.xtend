package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static com.incquerylabs.emdw.testing.common.utils.ModelUtil.*
import static org.junit.Assert.*
import org.eclipse.papyrusrt.xtumlrt.common.ActionCode

@SuiteClasses(#[
	OperationMappingTest,
	DestructorMappingTest
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
		assertEquals(TEST_SIDE_EFFECT_1, (xtumlrtObject.body as ActionCode).source)
		assertEquals(mapping.xtumlrtRoot.entities.filter(XTComponent).head, xtumlrtObject.returnType.type)
		assertEquals(umlObject.static, xtumlrtObject.static) 
		assertEquals(umlObject.visibility.transform, xtumlrtObject.visibility)
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
		assertEquals(TEST_SIDE_EFFECT_1, (xtumlrtObject.body as ActionCode).source)
		assertEquals(umlObject.name, xtumlrtObject.name)
		assertEquals(umlObject.static, xtumlrtObject.static) 
		assertEquals(umlObject.visibility.transform, xtumlrtObject.visibility)
	}

}
