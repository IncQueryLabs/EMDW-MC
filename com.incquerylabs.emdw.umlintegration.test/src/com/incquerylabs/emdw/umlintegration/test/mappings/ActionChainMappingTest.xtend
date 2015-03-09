package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.common.ActionChain
import org.eclipse.uml2.uml.Behavior
import org.eclipse.uml2.uml.UMLFactory
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import static org.junit.Assert.assertEquals

@RunWith(Parameterized)
class ActionChainMappingTest extends TransformationTest<Behavior, ActionChain> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(RootMapping mapping) {
		val transition = createTransition(mapping)
		val effect = UMLFactory.eINSTANCE.createOpaqueBehavior => [
			bodies += TEST_SIDE_EFFECT_1
			languages += CPP_LANGUAGE
		]
		transition.effect = effect
		effect
	}

	override protected getXtumlrtObjects(RootMapping mapping) {
		mapping.xtumlrtTopState.transitions.head.actionChain.asSet
	}
	
	override protected checkState(RootMapping mapping, Behavior umlObject, ActionChain xtumlrtObject) {
		assertEquals(TEST_SIDE_EFFECT_1, xtumlrtObject.actions.head.source)
	}

}