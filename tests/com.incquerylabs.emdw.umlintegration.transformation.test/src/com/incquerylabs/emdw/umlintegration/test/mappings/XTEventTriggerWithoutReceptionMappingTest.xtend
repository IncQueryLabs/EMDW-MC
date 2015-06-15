package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEventTrigger
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Trigger
import org.eclipse.uml2.uml.UMLFactory
import org.junit.Assert
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.assertEquals

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class XTEventTriggerWithoutReceptionMappingTest extends TransformationTest<Trigger, XTEventTrigger> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = UMLFactory.eINSTANCE.createStateMachine => [
			it.name = "myStateMachine"
		]
		val class = umlRoot.createClassInModel => [
			it.name = "myClass"
			it.classifierBehavior = stateMachine
		]
		val region = stateMachine.createRegion("myRegion")
		val sourceState = region.createSimpleState("sourceState")
		val targetState = region.createSimpleState("targetState")
		val transition = region.createTransition("myTransition", sourceState, targetState)
		val trigger = transition.createTrigger("myTrigger")
		val signal = umlRoot.createSignalAndSignalEvent(class, trigger) // this will become the trigger's event
		trigger
	}
	
	override protected assertMapping(RootMapping mapping, Trigger umlObject){
		val xtumlrtObjects = mapping.xtumlrtRoot.xtumlrtObjects
		Assert.assertTrue("Object not transformed", xtumlrtObjects.empty)
		val trace = mapping.traces.findFirst[umlElements.contains(umlObject)]
		Assert.assertNull("Trace not created", trace)
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.xtumlrtTopState.transitions.head.triggers.filter(XTEventTrigger)
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Trigger umlObject, XTEventTrigger xtumlrtObject) {
		val event = (mapping.xtumlrtRoot.entities.head as XTClass).events.head
		assertEquals(event, xtumlrtObject.signal)
	}

}