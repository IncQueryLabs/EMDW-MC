/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.transformation.test.dynamicbehavior

import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.junit.Before
import org.junit.Ignore

/**
 * Test case which is responsible for checking if the given transformation method is 
 * capable of creating a cpp structure model which can later be used to determine whether
 * State exit behavior actions are properly executed.
 * 
 * The model contains a transition with no behavior action and a trigger, as well as two 
 * states. The first of the states, has an exit action defined, the second defines no actions.
 * 
 * Creates the following xtuml model and initiates the target CPP model based on it.
 * 
 * - Package
 * 	 - Component
 * 		- Port
 * 		- Class
 * 			- SignalEvent based on Signal
 * 			- State Machine
 * 				- Region
 * 					- Init state
 * 					- State1 with exit action
 * 					- State2
 * 					- Transition1 between init and State1
 * 					- Transition2 between State1 and State2 triggered by SignalEvent		
 * 	 - Primitive Type definition
 * 	 - Protocol
 * 		- Signal
 */
@Ignore("dynamic behavior tests are not complete")
class StateExitBehaviorTest extends DynamicBehaviorBaseTest {

	@Before
	override init() {
		super.init
		ROOTCPPPACKAGES = 1
		CPPPROTOCOLS = 1
		CPPSIGNALS = 1
		CPPCLASSINPACK = 0
		CPPCOMPONENTS = 1
		CPPPORTS = 1
		CPPDIR = 6
		CPPHEADER = 6
		CPPBODY = 3
	}
	
	override protected prepareXtUmlModel(Model xtumlmodel) {
		val pack = xtumlmodel.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("Class")
		val topState = xtClass.createStateMachine("SM").createCompositeState("top")
		val protocol = pack.createXtProtocol("Protocol")
		val signal = protocol.createSignal("Signal")
		val signalEvent	 = component.createPort(protocol,"Port", VisibilityKind.PUBLIC).createXtSignalEvent(signal,xtClass,"SignalEvent")
		val init = topState.createInitialPoint("init")
		val s1 = topState.createSimpleState("s1")
		val s2 = topState.createSimpleState("s2")
		s1.createExitActionCode("Exit code", "C++", "TEST CODE")
		topState.createTransition(init,s1,"t1")
		topState.createTransition(s1,s2,"t2").createXTEventTrigger(signalEvent, "Trigger")

	
		pack
	}
}