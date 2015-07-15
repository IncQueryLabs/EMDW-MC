package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPTransition
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import java.util.ArrayList
import java.util.List
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.common.Transition
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

@SuiteClasses(#[
	CPPTransitionInClassTest
])
@RunWith(Suite)
class CPPTransitionMappingTestSuite {}

@RunWith(Parameterized)
class CPPTransitionInClassTest extends MappingBaseTest<XTClass, CPPComponent> {
	CPPDirectory rootDir;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("Class")
		val topState = xtClass.createStateMachine("SM").createCompositeState("top")
		val s1 = topState.createSimpleState("s1")
		val s2 = topState.createSimpleState("s2")
		topState.createTransition(s1,s2,"t2", "SAMPLE_CODE")
		
		return xtClass
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
	
	override protected assertResult(Model input, CPPModel result, XTClass xtObject, CPPComponent cppObject) {
		val xtTrans = xtObject.behaviour.top.allTransitions
		val cppClass = cppObject.subElements.filter(CPPClass).head
		val cppTrans = cppClass.subElements.filter(CPPTransition)
		assertEquals(xtTrans.size,cppTrans.size)
		cppTrans.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(commonTransition)
		]
	}
	
	private def List<Transition> getAllTransitions(CompositeState comp){
		val compstates = comp.substates.filter(CompositeState)
		val transitions = new ArrayList<Transition>()
		compstates.forEach[it |
			transitions.addAll(it.allTransitions)
		]
		transitions.addAll(comp.transitions)
		return transitions
	}
	
	override protected clearXtUmlElement(XTClass xtObject) {
		xtObject.behaviour.top.transitions.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTClass xtObject, CPPComponent cppObject) {
		val cppClass = cppObject.subElements.filter(CPPClass).head
		val cppTrans = cppClass.subElements.filter(CPPTransition)
		assertEquals(0,cppTrans.size)
	}
	
}