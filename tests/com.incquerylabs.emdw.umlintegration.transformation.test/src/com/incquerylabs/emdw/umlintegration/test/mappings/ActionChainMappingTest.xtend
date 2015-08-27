package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.ActionChain
import org.eclipse.uml2.uml.Behavior
import org.eclipse.uml2.uml.Model

import static org.junit.Assert.assertEquals

import static extension com.incquerylabs.emdw.testing.common.utils.ModelUtil.*
import static extension com.incquerylabs.emdw.testing.common.utils.UmlUtil.*
import static extension com.incquerylabs.emdw.testing.common.utils.XtumlUtil.*

class ActionChainMappingTest extends TransformationTest<Behavior, ActionChain> {

	override protected createUmlObject(Model umlRoot) {
		val transition = umlRoot.createTransition
		val effect = transition.createOpaqueBehavior
		effect
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.getXtumlrtTopState.transitions.head.actionChain.asSet
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Behavior umlObject, ActionChain xtumlrtObject) {
		assertEquals(TEST_SIDE_EFFECT_1, xtumlrtObject.actions.head.source)
	}

}