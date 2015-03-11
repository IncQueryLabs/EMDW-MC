package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.uml2.uml.Trigger
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import com.zeligsoft.xtumlrt.xtuml.XTEventTrigger
import com.zeligsoft.xtumlrt.xtuml.XTClass
import static org.junit.Assert.assertEquals

@RunWith(Parameterized)
class XTEventTriggerMappingTest extends TransformationTest<Trigger, XTEventTrigger> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(RootMapping mapping) {
		val trigger = createTrigger(mapping)
		createSignalForSignalEvent(mapping, trigger) // this will become the trigger's event
		trigger
	}

	override protected getXtumlrtObjects(RootMapping mapping) {
		mapping.xtumlrtTopState.transitions.head.triggers.filter(XTEventTrigger)
	}
	
	override protected checkState(RootMapping mapping, Trigger umlObject, XTEventTrigger xtumlrtObject) {
		val event = (mapping.xtumlrtRoot.entities.head as XTClass).events.head
		assertEquals(event, xtumlrtObject.signal)
	}

}