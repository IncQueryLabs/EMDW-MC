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
 * the dynamics of destructor methods work properly.
 * 
 * Creates the following xtuml model and initiates the target CPP model based on it.
 * 
 * - Package
 * 	 - Component
 * 		- Port
 * 		- Class
 * 			- a : Attribute with Primitive Type
 * 			- b : Attribute with User Defined Type
 * 			- ~TestClass() : Destructor operation
 * 			- SignalEvent based on Signal
 * 			- State Machine
 * 				- Region
 * 					- Init state
 * 					- State1
 * 					- State2
 * 					- Transition1 between init and State1
 * 					- Transition2	between State1 and State2 triggered by SignalEvent		
 * 	 - Primitive Type definition
 * 	 - User defined Type definition
 * 	 - Protocol
 * 		- Signal
 */
@RunWith(Parameterized)
class ClassDestructorTest extends DynamicBehaviorBaseTest {
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
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
		val xtClass = component.createXtClass("TestClass")

		val typedef = pack.createTypeDefinition("IntDefinition")
		val primitiveType = createPrimitiveType(typedef, "Integer")

		val typedef2 = pack.createTypeDefinition("UserTypeDefinition")
		val userDefinedType = createUserDefinedType(typedef2, "UserType")

		xtClass.createSingleAttribute(primitiveType, VisibilityKind.PUBLIC, false, "a")
		xtClass.createSingleAttribute(userDefinedType, VisibilityKind.PUBLIC, false, "b")

		xtClass.createOperation(VisibilityKind.PUBLIC, false, null, "~TestClass()", "DESTRUCTOR")

		val topState = xtClass.createStateMachine("SM").createCompositeState("top")
		val protocol = pack.createXtProtocol("Protocol")
		val signal = protocol.createSignal("Signal")
		val signalEvent = component.createPort(protocol, "Port", VisibilityKind.PUBLIC).
			createXtSignalEvent(signal, xtClass, "SignalEvent")
		val init = topState.createInitialPoint("init")
		val s1 = topState.createSimpleState("s1")
		val s2 = topState.createSimpleState("s2")
		topState.createTransition(init, s1, "t1")
		topState.createTransition(s1, s2, "t2", "SAMPLE_CODE").createXTEventTrigger(signalEvent, "Trigger")

		pack
	}
}