package com.incquerylabs.emdw.cpp.codegeneration.test.fsa

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.papyrusrt.xtumlrt.common.Model

import static extension com.incquerylabs.emdw.testing.common.utils.CppUtil.*
import static extension com.incquerylabs.emdw.testing.common.utils.XtumlUtil.*

class DirectoryStructureTest extends FileAndDirectoryBaseTest<Model, CPPModel> {
	
	override protected CPPModel prepareCPPModelWithURI(URI modelURI) {
		
		val resSet = new ResourceSetImpl();
		val resource = resSet.getResource(modelURI, true)
		resource.contents.get(0) as CPPModel
	}
	
	override protected prepareCPPModel1(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createPackage("RootPackage")
		val xtComponent1 = xtPackage.createXtComponent("Component1")
		val xtComponent2 = xtPackage.createXtComponent("Component2")
		val xtClass = xtComponent1.createXtClass("TEST1")
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
		
		val cppModelBodyDirectory = cppModel.eResource.createCPPDirectory
		val cppModelHeaderDirectory = cppModel.eResource.createCPPDirectory
		cppModel.bodyDir = cppModelBodyDirectory
		cppModel.headerDir = cppModelHeaderDirectory
		
		val cppPackage = cppModel.createCPPPackage(xtPackage)
		
		val cppComponent1 = cppPackage.createCPPComponentWithDirectoriesAndFiles(xtComponent1)
		
		cppPackage.createCPPComponentWithDirectoriesAndFiles(xtComponent2)
		
		val cppClassHeaderFile = cppComponent1.headerDirectory.createCPPHeaderFile
		val cppClassBodyFile = cppComponent1.bodyDirectory.createCPPBodyFile
		
		val cppClass = cppComponent1.createCPPClass(xtClass, cppClassHeaderFile, cppClassBodyFile)
		cppClass.createCPPEvent(classEvent)
		cppClass.createCPPEvent(classEvent2)
		cppClass.createCPPState(s1)
		cppClass.createCPPState(s2)
		cppClass.createCPPTransition(t1)
		cppClass.createCPPTransition(t2)
		cppClass.createCPPTransition(t3)
		cppClass.createCPPTransition(t4)
		
		cppModel
	}
		
	override protected prepareCPPModel2(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createPackage("RootPackage")
		val xtComponent1 = xtPackage.createXtComponent("Component1")
		val xtComponent2 = xtPackage.createXtComponent("Component2")
		val xtClass = xtComponent1.createXtClass("TEST2")
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
		
		val cppModelBodyDirectory = createCPPDirectory(cppModel.eResource)
		val cppModelHeaderDirectory = createCPPDirectory(cppModel.eResource)
		cppModel.bodyDir = cppModelBodyDirectory
		cppModel.headerDir = cppModelHeaderDirectory
		
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		
		cppPackage.createCPPComponentWithDirectoriesAndFiles(xtComponent1)
		
		val cppComponent2 = cppPackage.createCPPComponentWithDirectoriesAndFiles(xtComponent2)
		
		val cppClassHeaderFile = cppComponent2.headerDirectory.createCPPHeaderFile
		val cppClassBodyFile = cppComponent2.bodyDirectory.createCPPBodyFile
		
		val cppClass = createCPPClass(cppComponent2, xtClass, cppClassHeaderFile, cppClassBodyFile)
		cppClass.createCPPEvent(classEvent)
		cppClass.createCPPEvent(classEvent2)
		cppClass.createCPPState(s1)
		cppClass.createCPPState(s2)
		cppClass.createCPPTransition(t1)
		cppClass.createCPPTransition(t2)
		cppClass.createCPPTransition(t3)
		cppClass.createCPPTransition(t4)
		
		cppModel
	}
	
	
}