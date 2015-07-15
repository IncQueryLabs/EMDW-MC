package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

@SuiteClasses(#[
	CPPStateInClassTest
])
@RunWith(Suite)
class CPPStateMappingTestSuite {}

@RunWith(Parameterized)
class CPPStateInClassTest extends MappingBaseTest<CompositeState, CPPComponent> {
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
		topState.createTransition(s1,s2,"t2", "SAMPLE_CODE").createXTEventTrigger(classEvent, "Trigger")
		
		return topState
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponentWithDirectoriesAndFiles(cppPackage, xtComponent, rootDir)

		return cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, CompositeState xtObject, CPPComponent cppObject) {
		val cppClass = cppObject.subElements.filter(CPPClass).head
		val cppStates = cppClass.subElements.filter(CPPState)
		assertFalse(cppStates.exists[commonState == xtObject])
		assertEquals(2,cppStates.size)
		cppStates.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(commonState)
		]
	}
	
	override protected clearXtUmlElement(CompositeState xtObject) {
		xtObject.substates.clear
	}
	
	override protected assertClear(Model input, CPPModel result, CompositeState xtObject, CPPComponent cppObject) {
		val cppClass = cppObject.subElements.filter(CPPClass).head
		val cppStates = cppClass.subElements.filter(CPPState)
		assertEquals(0,cppStates.size)
	}
	
}