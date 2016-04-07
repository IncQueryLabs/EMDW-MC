/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.codegeneration.test.complex

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	MultiTransitionSameTriggerTest
])
@RunWith(Suite)
class MultipleTransitionSameTriggerTestSuite {}

class MultiTransitionSameTriggerTest extends TransformationTest<State, CPPClass> {
	
	override protected prepareCppModel(CPPModel cppModel) {
		
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createPackage("RootPackage")
		val xtComponent = xtPackage.createXtComponent("Component")
		val xtClass = xtComponent.createXtClass("TEST")
		val topState = xtClass.createStateMachine("SM").createCompositeState("top")
		val classEvent = xtClass.createXtClassEvent("ClassEvent")
		val classEvent2 = xtClass.createXtClassEvent("ClassEvent2")
		
		val init = topState.createInitialPoint("init")
		val s1 = topState.createSimpleState("s1")
		s1.createEntryActionCode("entry", "C++", "SAMPLE_entry")
		s1.createExitActionCode("s1_exit", "C++", "SOME s1 exit code")
		topState.createTransition(init, s1, "initTrans","C++", 
			'''
				SAMPLE_CODE
				some other code
			''')
		val s2 = topState.createSimpleState("s2")
		s2.createEntryActionCode("s2_entry", "C++", "SOME s2 entry action")
		
		val t1 = topState.createTransition(s1,s2,"t1", "SAMPLE_CODE",
			'''
				SAMPLE_CODE_2
				some more code
			''')
		t1.createXTEventTrigger(classEvent, "Trigger1")
		val t2 = topState.createTransition(s1,s2,"t2", "C++", "SAMPLE_CODE")
		t2.createXTEventTrigger(classEvent2, "Trigger2")
		
		
		val t3 = topState.createTransition(s1,s2,"t3", "C++", "SAMPLE_CODE")
		t3.createXTEventTrigger(classEvent2, "Trigger3")
		val t4 = topState.createTransition(s1,s2,"t4", "C++", "SAMPLE_CODE")
		t4.createXTEventTrigger(classEvent, "Trigger4")
		
		val cppPackage = cppModel.createCPPPackage(xtPackage)
		val cppComponent = cppPackage.createCPPComponentWithDirectoriesAndFiles(xtComponent)
		val cppClass = cppComponent.createCPPClass(xtClass, 
			createCPPHeaderFile(cppComponent.headerDirectory), 
			createCPPBodyFile(cppComponent.bodyDirectory)
		)
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