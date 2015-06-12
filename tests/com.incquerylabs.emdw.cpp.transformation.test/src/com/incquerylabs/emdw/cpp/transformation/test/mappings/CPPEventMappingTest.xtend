package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEvent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

@SuiteClasses(#[
	CPPEventMappingTest
])
@RunWith(Suite)
class CPPEventMappingTestSuite {}

@RunWith(Parameterized)
class CPPEventMappingTest extends MappingBaseTest<XTClass, CPPComponent> {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("Class")
		val topState = xtClass.createStateMachine("SM").createCompositeState("top")
		val classEvent = xtClass.createXtClassEvent("ClassEvent")
		val s1 = topState.createSimpleState("s1")
		val s2 = topState.createSimpleState("s2")
		val trans = topState.createTransition(s1,s2,"t2", "SAMPLE_CODE")
		trans.createXTEventTrigger(classEvent, "Trigger")
		
		return xtClass
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponent(cppPackage, xtComponent, null, null, null, null)

		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		cppComponent.headerDirectory = rootDir
		cppComponent.bodyDirectory = rootDir

		return cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTClass xtObject, CPPComponent cppObject) {
		val xtEvents = xtObject.events
		val cppClass = cppObject.subElements.filter(CPPClass).head
		val cppEvents = cppClass.subElements.filter(CPPEvent)
		assertEquals(xtEvents.size,cppEvents.size)
		cppEvents.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(xtEvent)
		]
	}
	
	override protected clearXtUmlElement(XTClass xtObject) {
		xtObject.events.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTClass xtObject, CPPComponent cppObject) {
		val cppClass = cppObject.subElements.filter(CPPClass).head
		val cppEvents = cppClass.subElements.filter(CPPEvent)
		assertEquals(0,cppEvents.size)
	}
	
	
}