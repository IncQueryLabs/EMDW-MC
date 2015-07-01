package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.uml2.uml.Behavior
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.UMLFactory
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.assertEquals

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import org.eclipse.papyrusrt.xtumlrt.common.ActionCode

@RunWith(Parameterized)
class StateEntryMappingTest extends TransformationTest<Behavior, ActionCode> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val sm = createStateMachine(umlRoot)
		val state = createSimpleState(sm.regions.head, "state")
		val effect = UMLFactory.eINSTANCE.createOpaqueBehavior => [
			bodies += TEST_SIDE_EFFECT_1
			languages += CPP_LANGUAGE
			name = "entry"
		]
		state.entry = effect
		effect
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		#{
			xtumlrtRoot.xtumlrtTopState.substates.head.entryAction
		}
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Behavior umlObject, ActionCode xtumlrtObject) {
		assertEquals(TEST_SIDE_EFFECT_1, xtumlrtObject.source)
		assertEquals("entry", xtumlrtObject.name)
	}

}