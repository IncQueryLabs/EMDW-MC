package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAction
import org.eclipse.uml2.uml.Behavior
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static com.incquerylabs.emdw.testing.common.utils.ModelUtil.*
import static org.junit.Assert.assertEquals

@SuiteClasses(#[
	StateEntryMappingTest
])
@RunWith(Suite)
class StateEntryMappingTestSuite {}

class StateEntryMappingTest extends TransformationTest<Behavior, XTAction> {

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
			xtumlrtRoot.xtumlrtTopState.substates.head.entryAction as XTAction
		}
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Behavior umlObject, XTAction xtumlrtObject) {
		assertEquals(TEST_SIDE_EFFECT_2, xtumlrtObject.body.head.source)
		assertEquals("entry", xtumlrtObject.name)
	}

}