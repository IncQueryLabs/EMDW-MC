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
class ClassConstructorTest extends TransformationTest<Behavior, ActionChain> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createXtUmlModel(RootMapping root) {
		val xtumlmodel = root.xtumlrtRoot
		val pack = xtumlmodel.createXtPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("TestClass")
		
		
		val primitiveType = pack.createTypeDefinition("IntDefinition").createPrimitiveType("Integer")
		val userDefinedType = pack.createTypeDefinition("UserTypeDefinition").createXTUserDefinedType("UserType")
		
		xtClass.createSingleAttribute(primitiveType, VisibilityKind.PUBLIC, false,"a")
		xtClass.createSingleAttribute(userDefinedType, VisibilityKind.PUBLIC, false,"b")
		
		xtClass.createOperation(VisibilityKind.PUBLIC,false,null,"TestClass()","CONSTRUCTOR_THAT_SETS_ATTRIBUTES",
			primitiveType.createParameter("a", DirectionKind.IN),
			userDefinedType.createParameter("b", DirectionKind.IN)
		)
		
		val topState = xtClass.createStateMachine("SM").createCompositeState("top")
		val protocol = pack.createXtProtocol("Protocol")
		val signal = protocol.createSignal("Signal")
		val signalEvent	 = component.createPort(protocol,"Port", VisibilityKind.PUBLIC).createXtSignalEvent(signal,xtClass,"SignalEvent")
		val init = topState.createInitialPoint("init")
		val exit = topState.createExitPoint("exit")
		val s1 = topState.createSimpleState("s1")
		val s2 = topState.createSimpleState("s2")
		topState.createTransition(init,s1,"t1")
		topState.createTransition(s1,s2,"t2", "SAMPLE_CODE").createXTEventTrigger(signalEvent, "Trigger")
		topState.createTransition(s2,exit,"t3")

		xtumlmodel
	}
	
	override protected createResultCppModel(RootMapping reference, CPPModel cppmodel, CPPDirectory cppdir) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected AssertResult(CPPModel result, CPPDirectory resultdir, CPPModel ref, CPPDirectory refdir) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	


}