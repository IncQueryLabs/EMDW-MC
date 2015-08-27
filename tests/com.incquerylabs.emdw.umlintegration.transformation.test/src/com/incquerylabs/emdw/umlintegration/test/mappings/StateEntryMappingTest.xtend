package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.ActionCode
import org.eclipse.uml2.uml.Behavior
import org.eclipse.uml2.uml.Model

import static com.incquerylabs.emdw.testing.common.utils.ModelUtil.*
import static org.junit.Assert.assertEquals

import static extension com.incquerylabs.emdw.testing.common.utils.UmlUtil.*
import static extension com.incquerylabs.emdw.testing.common.utils.XtumlUtil.*

class StateEntryMappingTest extends TransformationTest<Behavior, ActionCode> {

	override protected createUmlObject(Model umlRoot) {
		val sm = umlRoot.createStateMachine
		val state = sm.regions.head.createSimpleState("state")
		val effect = state.createEntryEffectWithDefaultCppEffect("entry")
		
		effect.bodies.clear
		effect.bodies += TEST_SIDE_EFFECT_2
		
		effect
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		#{
			xtumlrtRoot.xtumlrtTopState.substates.head.entryAction
		}
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Behavior umlObject, ActionCode xtumlrtObject) {
		assertEquals(TEST_SIDE_EFFECT_2, xtumlrtObject.source)
		assertEquals("entry", xtumlrtObject.name)
	}

}