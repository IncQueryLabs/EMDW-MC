package com.incquerylabs.emdw.cpp.transformation.test.dynamicbehavior

import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

/**
 * Test case which is responsible for checking if the given transformation method is 
 * capable of creating a cpp structure model which can later be used to determine whether
 * Signal parameters with a Class type can be accessed from the actions when the event 
 * is handled.
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
 * 					- State1 with an exit action
 * 					- State2 with an entry action
 * 					- Transition1 between init and State1
 * 					- Transition2	between State1 and State2 triggered by SignalEvent		
 * 	 - Class Type definition
 * 	 - Protocol
 * 		- Signal
 * 			-Class Type parameter
 */
@RunWith(Parameterized)
class EventClassTypeTest extends DynamicBehaviorBaseTest {
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
		ROOTCPPPACKAGES = 1
		CPPPROTOCOLS = 1
		CPPSIGNALS = 1
		CPPCLASSINPACK = 0
		CPPCOMPONENTS = 1
		CPPPORTS = 1
		CPPDIR = 7
		CPPHEADER = 7
		CPPBODY = 4
	}

	override protected prepareXtUmlModel(Model xtumlmodel) {

		val pack = xtumlmodel.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("Class")

		val paramClass = pack.createXtClass("ParamClass")
		pack.createTypeDefinition(paramClass, "ClassTypeDef")

		val topState = xtClass.createStateMachine("SM").createCompositeState("top")
		val protocol = pack.createXtProtocol("Protocol")

		val signal = protocol.createSignal("Signal")
		signal.createParameter(paramClass, "ClassParameter", DirectionKind.IN)
		val signalevent = component.createPort(protocol, "Port", VisibilityKind.PUBLIC).
			createXtSignalEvent(signal, xtClass, "signalevent")
		val init = topState.createInitialPoint("init")
		val s1 = topState.createSimpleState("s1")
		val s2 = topState.createSimpleState("s2")
		s1.createExitActionCode("exit", "STATE_EXIT_CODE")
		s2.createEntryActionCode("entry", "STATE_ENTRY_CODE")
		topState.createTransition(init, s1, "t1")
		topState.createTransition(s1, s2, "t2", "TRANSITION_SAMPLE_CODE").createXTEventTrigger(signalevent, "Trigger")

		pack
	}
}