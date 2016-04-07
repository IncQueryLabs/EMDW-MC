/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Denes Harmath - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEventTrigger
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Trigger
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.assertEquals

@SuiteClasses(#[
	XTEventTriggerMappingTest,
	XTEventTriggerWithReceptionInSuperClassMappingTest
])
@RunWith(Suite)
class XTEventTriggerMappingTestSuite {}

class XTEventTriggerMappingTest extends TransformationTest<Trigger, XTEventTrigger> {

	override protected createUmlObject(Model umlRoot) {
		val class = umlRoot.createClassInModel => [
			it.name = "myClass"
		]
		val stateMachine = class.createStateMachine("myStateMachine")
		val region = stateMachine.createRegion("myRegion")
		val sourceState = region.createSimpleState("sourceState")
		val targetState = region.createSimpleState("targetState")
		val transition = region.createTransition("myTransition", sourceState, targetState)
		val trigger = transition.createTrigger("myTrigger")
		val signal = umlRoot.createSignalAndSignalEvent(class, trigger) // this will become the trigger's event
		class.createOwnedReception("myReception", null, null) => [
			it.signal = signal
		]
		trigger
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.xtumlrtTopState.transitions.head.triggers.filter(XTEventTrigger)
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Trigger umlObject, XTEventTrigger xtumlrtObject) {
		val event = (mapping.xtumlrtRoot.entities.head as XTClass).events.head
		assertEquals(event, xtumlrtObject.signal)
	}

}

class XTEventTriggerWithReceptionInSuperClassMappingTest extends TransformationTest<Trigger, XTEventTrigger> {

	override protected createUmlObject(Model umlRoot) {
		val supClass = umlRoot.createClassInModel => [
			it.name = "superClass"
		]
		val class = umlRoot.createClassInModel => [
			it.name = "myClass"
		]
		class.createGeneralization(supClass)
		val stateMachine = class.createStateMachine("myStateMachine")
		val region = stateMachine.createRegion("myRegion")
		val sourceState = region.createSimpleState("sourceState")
		val targetState = region.createSimpleState("targetState")
		val transition = region.createTransition("myTransition", sourceState, targetState)
		val trigger = transition.createTrigger("myTrigger")
		val signal = umlRoot.createSignalAndSignalEvent(supClass, trigger) // this will become the trigger's event
		supClass.createOwnedReception("myReception", null, null) => [
			it.signal = signal
		]
		trigger
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTClass).findFirst[it.name=="myClass"].behaviour.top.transitions.head.triggers.filter(XTEventTrigger)
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Trigger umlObject, XTEventTrigger xtumlrtObject) {
		val event = mapping.xtumlrtRoot.entities.filter(XTClass).findFirst[it.name=="superClass"].events.head
		assertEquals(event, xtumlrtObject.signal)
	}

}

