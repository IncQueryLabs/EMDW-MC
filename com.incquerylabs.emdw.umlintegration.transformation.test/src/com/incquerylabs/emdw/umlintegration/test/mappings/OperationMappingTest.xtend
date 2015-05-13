package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import static org.junit.Assert.*

@RunWith(Parameterized)
class OperationMappingTest extends TransformationTest<org.eclipse.uml2.uml.Operation, Operation> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		createOperation(umlRoot, TEST_SIDE_EFFECT_1, createComponentInModel(umlRoot))
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTClass).head.operations
	}

	override protected checkXtumlrtObject(RootMapping mapping, org.eclipse.uml2.uml.Operation umlObject, Operation xtumlrtObject) {
		assertEquals(TEST_SIDE_EFFECT_1, xtumlrtObject.body.source)
		assertEquals(mapping.xtumlrtRoot.entities.filter(XTComponent).head, xtumlrtObject.returnType)
		assertEquals(umlObject.static, xtumlrtObject.static) 
		assertEquals(TransformationUtil.transform(umlObject.visibility), xtumlrtObject.visibility)
	}

}
