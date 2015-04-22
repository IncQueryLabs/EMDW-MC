package com.incquerylabs.emdw.xtumltocpp.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.xtumltocpp.test.TransformationTest
import com.incquerylabs.emdw.xtumltocpp.test.wrappers.TransformationWrapper
import com.zeligsoft.xtumlrt.common.DirectionKind
import com.zeligsoft.xtumlrt.common.Model
import com.zeligsoft.xtumlrt.common.VisibilityKind
import com.zeligsoft.xtumlrt.xtuml.XTClass
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.xtumltocpp.test.TransformationTestUtil.*

@RunWith(Parameterized)
class EventClassTypeTest extends TransformationTest<XTClass, CPPClass> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected prepareXtUmlModel(Model xtumlmodel) {
		val pack = xtumlmodel.createXtPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("Class")
		
		val paramClass = component.createXtClass("ParamClass")
		pack.createTypeDefinition(paramClass, "ClassTypeDef")
		
		val topState = xtClass.createStateMachine("SM").createCompositeState("top")
		val protocol = pack.createXtProtocol("Protocol")
		
		val signal = protocol.createSignal("Signal")
		signal.createParameter(paramClass, "ClassParameter", DirectionKind.IN)
		val signalEvent	 = component.createPort(protocol,"Port", VisibilityKind.PUBLIC).createXtSignalEvent(signal,xtClass,"SignalEvent")
		val init = topState.createInitialPoint("init")
		val exit = topState.createExitPoint("exit")
		val s1 = topState.createSimpleState("s1")
		val s2 = topState.createSimpleState("s2")
		s1.createExitActionCode("exit", "STATE_EXIT_CODE")
		s2.createEntryActionCode("entry", "STATE_ENTRY_CODE")
		topState.createTransition(init,s1,"t1")
		topState.createTransition(s1,s2,"t2", "TRANSITION_SAMPLE_CODE").createXTEventTrigger(signalEvent, "Trigger")
		topState.createTransition(s2,exit,"t3")

		xtClass
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected assertResult(Model input, CPPModel result, XTClass xtObject, CPPClass cppObject) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}