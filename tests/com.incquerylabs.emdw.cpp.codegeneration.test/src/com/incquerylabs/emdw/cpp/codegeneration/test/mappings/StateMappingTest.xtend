package com.incquerylabs.emdw.cpp.codegeneration.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTestUtil.*
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.CPPCodeGenerationWrapper

@RunWith(Parameterized)
class StateMappingTest extends TransformationTest<State, CPPClass> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createPackage("RootPackage")
		val xtComponent = xtPackage.createXtComponent("Component")
		val xtClass = xtComponent.createXtClass("TEST")
		val topState = xtClass.createStateMachine("SM").createCompositeState("top")
		val classEvent = xtClass.createXtClassEvent("ClassEvent")
		val init = topState.createInitialPoint("init")
		val s1 = topState.createSimpleState("s1")
		topState.createTransition(init, s1, "SAMPLE_CODE")
		val s2 = topState.createSimpleState("s2")
		val t = topState.createTransition(s1,s2,"t2", "SAMPLE_CODE")
		t.createXTEventTrigger(classEvent, "Trigger")
		
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val cppComponent = createCPPComponentWithDefaultDirectories(cppPackage, xtComponent)
		val cppClassHeader = createCPPHeaderFile(cppComponent.headerDirectory)
		val cppClassBody = createCPPBodyFile(cppComponent.bodyDirectory)
		val cppClass = createCPPClass(cppComponent, xtClass, cppClassHeader, cppClassBody)
		cppClass.createCPPEvent(classEvent)
		cppClass.createCPPState(s1)
		cppClass.createCPPState(s2)
		cppClass.createCPPTransition(t)
		
		cppClass
	}
	
	override protected assertResult(CPPModel result, CPPClass cppObject) {
		val wrapper = xform as CPPCodeGenerationWrapper

		val files = wrapper.codegen.generatedCPPSourceFiles
		val classHeader = files.get(cppObject.headerFile).toString
		assertTrue(classHeader.contains("enum TEST_state"))
		assertTrue(classHeader.contains("TEST_STATE_s1"))
		assertTrue(classHeader.contains("TEST_STATE_s2"))
		
		assertTrue(classHeader.contains("enum TEST_event"))
		assertTrue(classHeader.contains("TEST_EVENT_ClassEvent"))
		
		// check state and transition operations in declaration
		assertTrue(classHeader.contains("process_event_in_s1_state"))
		assertTrue(classHeader.contains("perform_actions_on_t2_transition_from_s1_to_s2"))
		assertTrue(classHeader.contains("process_event_in_s2_state"))
		
	}
	
}