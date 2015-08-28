package com.incquerylabs.emdw.cpp.transformation.test.dynamicbehavior

import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.junit.Before
import org.junit.Ignore

/**
 * Test case which is responsible for checking if the given transformation method is 
 * capable of creating a cpp structure model which can later be used to determine whether
 * self-transition behavior actions are properly executed.
 * 
 * The model contains a state with no actions defined and a self transition on given state, 
 * which defines a behavior action and is triggered by a SignalEvent
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
 * 					- State1
 * 					- Transition1 between init and State1
 * 					- Transition2 between State1 and State1 triggered by SignalEvent with action code	
 * 	 - Primitive Type definition
 * 	 - Protocol
 * 		- Signal
 */

@Ignore("dynamic behavior tests are not complete")
class SelfTransitionBehaviorTest extends DynamicBehaviorBaseTest {

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
		val port = component.createPort(protocol,"Port", VisibilityKind.PUBLIC)
		val signalEvent	= port.createXtSignalEvent(signal,xtClass,"SignalEvent")
		
		val init = topState.createInitialPoint("init")
		val s1 = topState.createSimpleState("s1")
		topState.createTransition(init,s1,"t1")
		topState.createTransition(s1,s1,"t2", "SAMPLE_CODE").createXTEventTrigger(signalEvent, "Trigger")
		
		pack
	}
}