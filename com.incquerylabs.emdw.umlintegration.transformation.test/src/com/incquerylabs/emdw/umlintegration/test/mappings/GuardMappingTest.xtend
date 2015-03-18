package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.common.Guard
import org.eclipse.uml2.uml.Constraint
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.UMLFactory
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.assertEquals

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class GuardMappingTest extends TransformationTest<Constraint, Guard> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val transition = createTransition(umlRoot)
		val umlFactory = UMLFactory.eINSTANCE
		val guard = umlFactory.createConstraint => [
			specification = umlFactory.createOpaqueExpression => [
				bodies += TEST_EXPRESSION
				languages += CPP_LANGUAGE
			]
		]
		transition.guard = guard
		guard
	}

	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.xtumlrtTopState.transitions.head.guard.asSet
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Constraint umlObject, Guard xtumlrtObject) {
		assertEquals(TEST_EXPRESSION, xtumlrtObject.body.source)
	}

}