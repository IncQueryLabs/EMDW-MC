package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.common.ActionChain
import org.eclipse.uml2.uml.Behavior
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.UMLFactory
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.assertEquals

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class ActionChainMappingTest extends TransformationTest<Behavior, ActionChain> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val transition = createTransition(umlRoot)
		val effect = UMLFactory.eINSTANCE.createOpaqueBehavior => [
			bodies += TEST_SIDE_EFFECT_1
			languages += CPP_LANGUAGE
		]
		transition.effect = effect
		effect
	}

	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.xtumlrtTopState.transitions.head.actionChain.asSet
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Behavior umlObject, ActionChain xtumlrtObject) {
		assertEquals(TEST_SIDE_EFFECT_1, xtumlrtObject.actions.head.source)
	}

}