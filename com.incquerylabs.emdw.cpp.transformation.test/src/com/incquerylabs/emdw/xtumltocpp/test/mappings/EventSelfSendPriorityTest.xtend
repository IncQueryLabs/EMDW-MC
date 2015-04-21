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

import static extension com.incquerylabs.emdw.xtumltocpp.test.TransformationTestUtil.*

@RunWith(Parameterized)
class EventSelfSendPriorityTest extends TransformationTest<Behavior, ActionChain> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createXtUmlModel(RootMapping root) {
		val xtumlmodel = root.xtumlrtRoot
		val pack = xtumlmodel.createXtPackage("RootPackage")
		
		val aComponent = pack.createXtComponent("AComponent")
		val aClass = aComponent.createXtClass("AClass")
		val bComponent = pack.createXtComponent("BComponent")
		val bClass = bComponent.createXtClass("BClass")
		
		val primitiveType = pack.createTypeDefinition("IntDefinition").createPrimitiveType("Integer")
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
		val aExit = aTop.createExitPoint("exit")
		val aS1 = aTop.createSimpleState("s1")
		val aS2 = aTop.createSimpleState("s2")
		val aS3 = aTop.createSimpleState("s3")
		
		aTop.createTransition(aInit,aS1,"aT1")
		aTop.createTransition(aS1,aS2,"aT2", "i++", "Send E1 to SELF").createGuard("aT2Guard", "[i<10]")
		aTop.createTransition(aS2,aS1,"aT3").createXTEventTrigger(e1SignalEvent, "E1_Trigger_At_aT3")
		aTop.createTransition(aS2,aS3,"aT4").createXTEventTrigger(e2SignalEvent, "E2_Trigger_At_aT4")
		aTop.createTransition(aS1,aS3,"aT5").createXTEventTrigger(e2SignalEvent, "E2_Trigger_At_aT5")
		aTop.createTransition(aS3,aExit,"aT6")
		
		val bTop = bClass.createStateMachine("SM").createCompositeState("top")
		val bInit = bTop.createInitialPoint("init")
		val bExit = bTop.createExitPoint("exit")
		val bS1 = bTop.createSimpleState("s1")
		
		bTop.createTransition(bInit,bS1,"bT1")
		bTop.createTransition(bS1,bS1,"bT2", "i++").createGuard("bt1Guard", "[i<5]")
		bTop.createTransition(bS1,bExit,"bT3", "SEND E2 to A").createGuard("bt1Guard", "[i==5]")

		xtumlmodel
	}
	
	override protected createResultCppModel(RootMapping reference, CPPModel cppmodel, CPPDirectory cppdir) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected AssertResult(CPPModel result, CPPDirectory resultdir, CPPModel ref, CPPDirectory refdir) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	


}