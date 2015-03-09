package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.common.Guard
import org.eclipse.uml2.uml.Constraint
import org.eclipse.uml2.uml.UMLFactory
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import static org.junit.Assert.assertEquals

@RunWith(Parameterized)
class GuardMappingTest extends TransformationTest<Constraint, Guard> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	static val TEST_CODE = "true"
	
	override protected createUmlObject(RootMapping mapping) {
		val transition = createTransition(mapping)
		val umlFactory = UMLFactory.eINSTANCE
		val guard = umlFactory.createConstraint => [
			specification = umlFactory.createOpaqueExpression => [
				bodies += TEST_CODE
				languages += CPP_LANGUAGE
			]
		]
		transition.guard = guard
		guard
	}

	override protected getXtumlrtObjects(RootMapping mapping) {
		mapping.xtumlrtTopState.transitions.head.guard.asSet
	}
	
	override protected checkState(RootMapping mapping, Constraint umlObject, Guard xtumlrtObject) {
		assertEquals(TEST_CODE, xtumlrtObject.body.source)
	}

}