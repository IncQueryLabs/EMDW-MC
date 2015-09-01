package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.Guard
import org.eclipse.uml2.uml.Constraint
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static com.incquerylabs.emdw.testing.common.utils.ModelUtil.*
import static org.junit.Assert.assertEquals

@SuiteClasses(#[
	GuardMappingTest
])
@RunWith(Suite)
class GuardMappingTestSuite {}

class GuardMappingTest extends TransformationTest<Constraint, Guard> {

	override protected createUmlObject(Model umlRoot) {
		val transition = umlRoot.createTransition
		val guard = transition.createGuardWithDeafultCppExpression
		guard
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.xtumlrtTopState.transitions.head.guard.asSet
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Constraint umlObject, Guard xtumlrtObject) {
		assertEquals(TEST_EXPRESSION, xtumlrtObject.body.source)
	}

}