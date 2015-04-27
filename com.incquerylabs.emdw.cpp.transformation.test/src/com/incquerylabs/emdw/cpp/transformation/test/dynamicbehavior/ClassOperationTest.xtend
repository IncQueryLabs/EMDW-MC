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
 * Operation parameters can be accessed properly from the operation behavior.
 * 
 * Creates the following xtuml model and initiates the target CPP model based on it.
 * 
 * - Package
 * 	 - Component
 * 		- Port
 * 		- Class
 * 			- a : Attribute with Primitive Type
 * 			- b : Attribute with User Defined Type
 * 			- operation(a,b) : Operation with multiple, different typed parameters
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
 * 	 - Class Type definition
 * 	 - Protocol
 * 		- Signal
 */
@RunWith(Parameterized)
class ClassOperationTest extends DynamicBehaviorBaseTest {
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
		ROOTCPPPACKAGES = 1
		CPPPROTOCOLS = 1
		CPPSIGNALS = 1
		CPPCLASSINPACK = 1
		CPPCOMPONENTS = 1
		CPPPORTS = 1
		CPPDIR = 7
		CPPHEADER = 7
		CPPBODY = 4
	}
	
	override protected prepareXtUmlModel(Model xtumlmodel) {
		val pack = xtumlmodel.createXtPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("TestClass")
		
		val typedef = pack.createTypeDefinition("IntDefinition")
		val primitiveType = pack.createPrimitiveType(typedef, "Integer")
		
		val typedef2 = pack.createTypeDefinition("UserTypeDefinition")
		val userDefinedType = pack.createXTUserDefinedType(typedef2, "UserType")
		val classType = component.createXtClass("ParamClass")
		pack.createTypeDefinition(classType, "ClassTypeDef")
		
		xtClass.createOperation(VisibilityKind.PUBLIC,false,classType,"operation","OPERATION_WITH_MULTIPLE_PARAMS",
			primitiveType.createParameter("a", DirectionKind.IN),
			userDefinedType.createParameter("b", DirectionKind.IN)
		)
		
		val topState = xtClass.createStateMachine("SM").createCompositeState("top")
		val protocol = pack.createXtProtocol("Protocol")
		val signal = protocol.createSignal("Signal")
		val signalEvent	 = component.createPort(protocol,"Port", VisibilityKind.PUBLIC).createXtSignalEvent(signal,xtClass,"SignalEvent")
		val init = topState.createInitialPoint("init")
		val s1 = topState.createSimpleState("s1")
		val s2 = topState.createSimpleState("s2")
		topState.createTransition(init,s1,"t1")
		topState.createTransition(s1,s2,"t2", "SAMPLE_CODE").createXTEventTrigger(signalEvent, "Trigger")

		pack
	}

}