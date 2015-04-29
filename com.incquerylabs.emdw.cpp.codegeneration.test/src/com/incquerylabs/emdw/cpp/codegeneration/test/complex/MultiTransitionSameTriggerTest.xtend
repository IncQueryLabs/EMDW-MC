package com.incquerylabs.emdw.cpp.codegeneration.test.complex

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class MultiTransitionSameTriggerTest extends TransformationTest<State, CPPClass> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createXtPackage("RootPackage")
		val xtComponent = xtPackage.createXtComponent("Component")
		val xtClass = xtComponent.createXtClass("TEST")
		val topState = xtClass.createStateMachine("SM").createCompositeState("top")
		val classEvent = xtClass.createXtClassEvent("ClassEvent")
		val classEvent2 = xtClass.createXtClassEvent("ClassEvent2")
		
		val init = topState.createInitialPoint("init")
		val s1 = topState.createSimpleState("s1")
		s1.createEntryActionCode("entry", "SAMPLE_entry")
		s1.createExitActionCode("s1_exit", "SOME s1 exit code")
		topState.createTransition(init, s1, "initTrans",
			'''
				SAMPLE_CODE
				some other code
			''')
		val s2 = topState.createSimpleState("s2")
		s2.createEntryActionCode("s2_entry", "SOME s2 entry action")
		
		val t1 = topState.createTransition(s1,s2,"t1", "SAMPLE_CODE",
			'''
				SAMPLE_CODE_2
				some more code
			''')
		t1.createXTEventTrigger(classEvent, "Trigger1")
		val t2 = topState.createTransition(s1,s2,"t2", "SAMPLE_CODE")
		t2.createXTEventTrigger(classEvent2, "Trigger2")
		
		
		val t3 = topState.createTransition(s1,s2,"t3", "SAMPLE_CODE")
		t3.createXTEventTrigger(classEvent2, "Trigger3")
		val t4 = topState.createTransition(s1,s2,"t4", "SAMPLE_CODE")
		t4.createXTEventTrigger(classEvent, "Trigger4")
		
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val cppComponent = createCPPComponent(cppPackage, xtComponent, null, null, null, null)
		val cppClass = createCPPClass(cppComponent, xtClass, null, null)
		cppClass.createCPPEvent(classEvent)
		cppClass.createCPPEvent(classEvent2)
		cppClass.createCPPState(s1)
		cppClass.createCPPState(s2)
		cppClass.createCPPTransition(t1)
		cppClass.createCPPTransition(t2)
		cppClass.createCPPTransition(t3)
		cppClass.createCPPTransition(t4)
		
		cppClass
	}
	
	override protected assertResult(CPPModel result, CPPClass cppObject) {
	}
	
}