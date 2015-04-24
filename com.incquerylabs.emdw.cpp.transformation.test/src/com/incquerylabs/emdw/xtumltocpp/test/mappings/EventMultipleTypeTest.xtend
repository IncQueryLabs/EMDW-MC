package com.incquerylabs.emdw.xtumltocpp.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.xtumltocpp.test.TransformationTest
import com.incquerylabs.emdw.xtumltocpp.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPackage
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.xtumltocpp.test.TransformationTestUtil.*

/**
 * Test case which is responsible for checking if the given transformation method is 
 * capable of creating a cpp structure model which can later be used to determine whether
 * in case of multiple transitions leading to a single state, the correct dynamic behavior
 * is invoked and the signal parameters can be accessed correctly
 * 
 * Also generates xtumlrt and cpp instance models in the model/EventClassTypeTest/ref 
 * folder, which can be later used as reference.
 * 
 * Creates the following xtuml model and initiates the target CPP model bsed on it.
 * 
 * - Package
 * 	 - Component
 * 		- Port
 * 		- Class
 * 			- SignalEvent1 based on Signal1
 *		 	- SignalEvent2 based on Signal2
 *			- SignalEvent3 based on Signal3
 * 			- State Machine
 * 				- Region
 * 					- Init state
 * 					- State1 with an exit action
 * 					- State2 with an entry action
 * 					- State3
 * 					- State4
 * 					- State5 
 * 					- Transition1 between init and State1
 * 					- Transition2 between State1 and State2 with action code, triggered by SignalEvent1
 * 					- Transition3 between State1 and State3 with action code, triggered by SignalEvent2
 * 					- Transition4 between State1 and State4 with action code, triggered by SignalEvent3
 * 					- Transition5 between State2 and State5 with action code, triggered by SignalEvent1
 * 					- Transition6 between State3 and State5 with action code, triggered by SignalEvent2
 * 					- Transition7 between State4 and State5 with action code, triggered by SignalEvent3
 * 	 - Primitive Type definition
 * 	 - User defined Type definition		
 * 	 - Class Type definition
 * 	 - Protocol
 * 		- Signal1
 * 			-Class Type parameter
 * 		- Signal2
 * 			-Primitive Type parameter
 * 		- Signal3
 * 			-User Defined Type parameter
 */
 @RunWith(Parameterized)
class EventMultipleTypeTest extends TransformationTest<XTClass, CPPClass> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
		
	override protected prepareXtUmlModel(Model xtumlmodel) {
		val pack = xtumlmodel.createXtPackage("RootPackage")
		
		val typedef = pack.createTypeDefinition("IntDefinition")
		val primitiveType = pack.createPrimitiveType(typedef, "Integer")
		
		val typedef2 = pack.createTypeDefinition("UserTypeDefinition")
		val userDefinedType = pack.createXTUserDefinedType(typedef2, "UserType")
		
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("Class")
		
		val classType = component.createXtClass("ParamClass")
		pack.createTypeDefinition(classType, "ClassTypeDef")
		
		val topState = xtClass.createStateMachine("SM").createCompositeState("top")
		val protocol = pack.createXtProtocol("Protocol")
		
		val primitiveSignal = protocol.createSignal("primitiveSignal")
		primitiveSignal.createParameter(primitiveType, "primitiveParameter", DirectionKind.IN)
		val userDefinedSignal = protocol.createSignal("userDefinedSignal")
		userDefinedSignal.createParameter(userDefinedType, "userDefinedParameter", DirectionKind.IN)
		val classSignal = protocol.createSignal("classSignal")
		classSignal.createParameter(classType, "classParameter", DirectionKind.IN)
		
		val port = component.createPort(protocol,"Port", VisibilityKind.PUBLIC)
		
		val primitiveEvent = port.createXtSignalEvent(primitiveSignal,xtClass,"SignalEvent")
		val userDefinedEvent = port.createXtSignalEvent(primitiveSignal,xtClass,"SignalEvent")
		val classEvent = port.createXtSignalEvent(primitiveSignal,xtClass,"SignalEvent")
		
		
		val init = topState.createInitialPoint("init")
		val s1 = topState.createSimpleState("s1")
		val s2 = topState.createSimpleState("s2")
		val s3 = topState.createSimpleState("s3")
		val s4 = topState.createSimpleState("s4")
		val s5 = topState.createSimpleState("s5")
		s1.createExitActionCode("exit", "STATE_EXIT_CODE")
		s2.createEntryActionCode("entry", "STATE_ENTRY_CODE")
		
		topState.createTransition(init,s1,"t1")
		
		topState.createTransition(s1,s2,"t2", "TRANSITION_SAMPLE_CODE").createXTEventTrigger(primitiveEvent, "Trigger")
		topState.createTransition(s1,s3,"t3", "TRANSITION_SAMPLE_CODE").createXTEventTrigger(userDefinedEvent, "Trigger")
		topState.createTransition(s1,s4,"t4", "TRANSITION_SAMPLE_CODE").createXTEventTrigger(classEvent, "Trigger")
		
		topState.createTransition(s2,s5,"t2", "TRANSITION_SAMPLE_CODE").createXTEventTrigger(primitiveEvent, "Trigger")
		topState.createTransition(s3,s5,"t3", "TRANSITION_SAMPLE_CODE").createXTEventTrigger(userDefinedEvent, "Trigger")
		topState.createTransition(s4,s5,"t1", "TRANSITION_SAMPLE_CODE").createXTEventTrigger(classEvent, "Trigger")

		xtClass
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.rootPackages.head as XTPackage
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponent(cppPackage, xtComponent, null, null, null, null)
		val xtClass = xtComponent.ownedClasses.head as XTClass
		val cppClass = createCPPClass(cppComponent, xtClass, null, null)
		
		cppClass
	}
	
	override protected assertResult(Model input, CPPModel result, XTClass xtObject, CPPClass cppObject) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}