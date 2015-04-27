package com.incquerylabs.emdw.cpp.transformation.test.dynamicbehavior

import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

/**
 * Test case which is responsible for checking if the given transformation method is 
 * capable of creating a cpp structure model which can later be used to determine whether
 * Self-sent events have priority over external events
 * 
 * The model contains two components with two classes and state machines. Class A sends
 * itself ten E1 events, Class B sends Class A an E2 event after a certain time. The desired
 * behavior is, that all of the E1 events are processed before the single E2 event, as self 
 * sent events are prioritized.
 * 
 * Creates the following xtuml model and initiates the target CPP model based on it.
 * 
 * - Package
 * 	 - Component A 
 * 		- Port A
 * 		- Class A
 * 			- SignalEvent based on E1 Signal
 *			- SignalEvent based on E2 Signal
 * 			- State Machine
 * 				- Region
 * 					- Init state
 * 					- State1 
 * 					- State2 
 * 					- State3 
 * 					- Transition1 between init and State1
 * 					- Transition2 between State1 and State2 Guard: i < 10 Action: send E1 to self;i++	
 * 					- Transition3 between State2 and State1 triggered by E1
 * 					- Transition4 between State2 and State3 triggered by E2	
 * 					- Transition5 between State1 and State3 triggered by E2
 * 		- Connector A to B
 * 	- Component B
 * 		- Port B
 * 		- Class B
 * 			- SignalEvent based on E2 Signal
 * 			- State Machine
 * 				- Region
 * 					- Init state
 * 					- State1 with an exit action
 * 					- State2 with an entry action
 * 					- Transition1 between init and State1
 * 					- Transition2 between State1 and State1 Guard: i<5 Action: i++	
 * 					- Transition3 between State1 and State2 Guard: i==5 Action: Send E2 to A
 
 * 	 - Class Type definition
 * 	 - Protocol
 * 		- E1 Signal
 * 		- E2 Signal
 */
@RunWith(Parameterized)
class EventSelfSendPriorityTest extends DynamicBehaviorBaseTest{
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
		ROOTCPPPACKAGES = 1
		CPPPROTOCOLS = 1
		CPPSIGNALS = 1
		CPPCLASSINPACK = 1
		CPPCOMPONENTS = 2
		CPPPORTS = 1
		CPPDIR = 10
		CPPHEADER = 12
		CPPBODY = 6
	}
	
	override protected prepareXtUmlModel(Model xtumlmodel) {
		val pack = xtumlmodel.createXtPackage("RootPackage")
		
		val aComponent = pack.createXtComponent("AComponent")
		val aClass = aComponent.createXtClass("AClass")
		val bComponent = pack.createXtComponent("BComponent")
		val bClass = bComponent.createXtClass("BClass")
		val typedef = pack.createTypeDefinition("IntDefinition")
		val primitiveType = pack.createPrimitiveType(typedef, "Integer")

		aClass.createSingleAttribute(primitiveType, VisibilityKind.PUBLIC, false,"i")
		bClass.createSingleAttribute(primitiveType, VisibilityKind.PUBLIC, false,"i")
		
		val protocol = pack.createXtProtocol("Protocol")
		val e1Signal = protocol.createSignal("SignalE1")
		val e2Signal = protocol.createSignal("SignalE2")
		val aPort = aComponent.createPort(protocol,"APort", VisibilityKind.PUBLIC)
		val bPort = bComponent.createPort(protocol,"BPort", VisibilityKind.PUBLIC)
		createConnector("AtoB", aPort,bPort)
		
		val e1SignalEvent = aPort.createXtSignalEvent(e1Signal,aClass,"E1SignalEvent")
		val e2SignalEvent = aPort.createXtSignalEvent(e2Signal,aClass,"E2SignalEvent")
		
		val aTop = aClass.createStateMachine("SM").createCompositeState("top")
		val aInit = aTop.createInitialPoint("init")
		val aS1 = aTop.createSimpleState("s1")
		val aS2 = aTop.createSimpleState("s2")
		val aS3 = aTop.createSimpleState("s3")
		
		aTop.createTransition(aInit,aS1,"aT1")
		aTop.createTransition(aS1,aS2,"aT2", "i++", "Send E1 to SELF").createGuard("aT2Guard", "[i<10]")
		aTop.createTransition(aS2,aS1,"aT3").createXTEventTrigger(e1SignalEvent, "E1_Trigger_At_aT3")
		aTop.createTransition(aS2,aS3,"aT4").createXTEventTrigger(e2SignalEvent, "E2_Trigger_At_aT4")
		aTop.createTransition(aS1,aS3,"aT5").createXTEventTrigger(e2SignalEvent, "E2_Trigger_At_aT5")
		
		val bTop = bClass.createStateMachine("SM").createCompositeState("top")
		val bInit = bTop.createInitialPoint("init")
		val bS1 = bTop.createSimpleState("s1")
		val bS2 = bTop.createSimpleState("s2")
		
		bTop.createTransition(bInit,bS1,"bT1")
		bTop.createTransition(bS1,bS1,"bT2", "i++").createGuard("bt1Guard", "[i<5]")
		bTop.createTransition(bS1,bS2,"bT3", "SEND E2 to A").createGuard("bt1Guard", "[i==5]")

		pack
	}
}