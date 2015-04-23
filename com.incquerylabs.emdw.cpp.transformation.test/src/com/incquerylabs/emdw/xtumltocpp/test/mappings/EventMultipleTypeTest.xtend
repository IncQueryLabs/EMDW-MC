package com.incquerylabs.emdw.xtumltocpp.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.xtumltocpp.test.TransformationTest
import com.incquerylabs.emdw.xtumltocpp.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.xtumltocpp.test.TransformationTestUtil.*

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
		val exit = topState.createExitPoint("exit")
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
		
		topState.createTransition(s5,exit,"t2")

		xtClass
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected assertResult(Model input, CPPModel result, XTClass xtObject, CPPClass cppObject) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}