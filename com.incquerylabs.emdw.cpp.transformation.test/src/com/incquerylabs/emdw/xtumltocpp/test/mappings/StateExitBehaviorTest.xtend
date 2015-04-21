package com.incquerylabs.emdw.xtumltocpp.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.incquerylabs.emdw.xtumltocpp.test.TransformationTest
import com.incquerylabs.emdw.xtumltocpp.test.wrappers.TransformationWrapper
import com.zeligsoft.xtumlrt.common.ActionChain
import com.zeligsoft.xtumlrt.common.VisibilityKind
import org.eclipse.uml2.uml.Behavior
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.assertEquals

import static extension com.incquerylabs.emdw.xtumltocpp.test.TransformationTestUtil.*

@RunWith(Parameterized)
class StateExitBehaviorTest extends TransformationTest<Behavior, ActionChain> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createXtUmlModel(RootMapping root) {
		val xtumlmodel = root.xtumlrtRoot
		val pack = xtumlmodel.createXtPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("Class")
		val topState = xtClass.createStateMachine("SM").createCompositeState("top")
		val protocol = pack.createXtProtocol("Protocol")
		val signal = protocol.createSignal("Signal")
		val signalEvent	 = component.createPort(protocol,"Port", VisibilityKind.PUBLIC).createXtSignalEvent(signal,xtClass,"SignalEvent")
		val init = topState.createInitialPoint("init")
		val exit = topState.createExitPoint("exit")
		val s1 = topState.createSimpleState("s1")
		val s2 = topState.createSimpleState("s2")
		s1.createExitActionCode("Exit code", "TEST CODE")
		topState.createTransition(init,s1,"t1")
		topState.createTransition(s1,s2,"t2").createXTEventTrigger(signalEvent, "Trigger")
		topState.createTransition(s2,exit,"t3")


		xtumlmodel
	}
		
	override protected createResultCppModel(RootMapping reference, CPPModel cppmodel, CPPDirectory cppdir) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected AssertResult(CPPModel result, CPPDirectory resultdir, CPPModel ref, CPPDirectory refdir) {
		assertEquals("","")
	}
	


}