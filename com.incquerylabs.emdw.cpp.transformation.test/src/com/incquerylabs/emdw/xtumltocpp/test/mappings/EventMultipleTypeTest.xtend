package com.incquerylabs.emdw.xtumltocpp.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.incquerylabs.emdw.xtumltocpp.test.TransformationTest
import com.incquerylabs.emdw.xtumltocpp.test.wrappers.TransformationWrapper
import com.zeligsoft.xtumlrt.common.ActionChain
import com.zeligsoft.xtumlrt.common.DirectionKind
import com.zeligsoft.xtumlrt.common.VisibilityKind
import org.eclipse.uml2.uml.Behavior
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.xtumltocpp.test.TransformationTestUtil.*

@RunWith(Parameterized)
class EventMultipleTypeTest extends TransformationTest<Behavior, ActionChain> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
		
	override protected createXtUmlModel(RootMapping root) {
		val xtumlmodel = root.xtumlrtRoot
		val pack = xtumlmodel.createXtPackage("RootPackage")
		
		val primitiveType = pack.createTypeDefinition("IntDefinition").createPrimitiveType("Integer")
		val userDefinedType = pack.createTypeDefinition("UserTypeDefinition").createXTUserDefinedType("UserType")
		
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

		xtumlmodel
	}
	
	override protected createResultCppModel(RootMapping reference, CPPModel cppmodel, CPPDirectory cppdir) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected AssertResult(CPPModel result, CPPDirectory resultdir, CPPModel ref, CPPDirectory refdir) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	


}