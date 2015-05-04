package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPTransition
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import java.util.ArrayList
import java.util.List
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Transition
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPackage
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

@RunWith(Parameterized)
class CPPTransitionInClassTest extends MappingBaseTest<XTClass, CPPClass> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createXtPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("Class")
		val topState = xtClass.createStateMachine("SM").createCompositeState("top")
		val s1 = topState.createSimpleState("s1")
		val s2 = topState.createSimpleState("s2")
		topState.createTransition(s1,s2,"t2", "SAMPLE_CODE")
		
		xtClass
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.rootPackages.head as XTPackage
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponent(cppPackage, xtComponent, null, null, null, null)
		val xtClass = xtComponent.ownedClasses.head as XTClass
		val cppClass = createCPPClass(cppComponent, xtClass, null, null)
		
		cppClass
	}
	
	override protected assertResult(Model input, CPPModel result, XTClass xtObject, CPPClass cppObject) {
		val xtTrans = xtObject.behaviour.top.allTransitions
		val cppTrans = cppObject.subElements.filter(CPPTransition)
		assertEquals(xtTrans.size,cppTrans.size)
		cppTrans.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(commonTransition)
		]
	}
	
	private def List<Transition> getAllTransitions(CompositeState comp){
		val compstates = comp.substates.filter(CompositeState)
		val transitions = new ArrayList<Transition>()
		compstates.forEach[
			transitions.addAll(allTransitions)
		]
		transitions.addAll(comp.transitions)
		transitions
	}
	
	override protected clearXtUmlElement(XTClass xtObject) {
		xtObject.behaviour.top.transitions.clear
	}
	
}


@RunWith(Parameterized)
class CPPTransitionInComponentTest extends MappingBaseTest<XTComponent, CPPComponent> {
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createXtPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val topState = component.createStateMachine("SM").createCompositeState("top")
		val s1 = topState.createSimpleState("s1")
		val s2 = topState.createSimpleState("s2")
		topState.createTransition(s1,s2,"t2", "SAMPLE_CODE")

		component
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.rootPackages.head as XTPackage
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponent(cppPackage, xtComponent, null, null, null, null)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTComponent xtObject, CPPComponent cppObject) {
		val xtTrans = xtObject.behaviour.top.allTransitions
		val cppTrans = cppObject.subElements.filter(CPPTransition)
		assertEquals(xtTrans.size,cppTrans.size)
		cppTrans.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(commonTransition)
		]
	}
	
	private def List<Transition> getAllTransitions(CompositeState comp){
		val compstates = comp.substates.filter(CompositeState)
		val transitions = new ArrayList<Transition>()
		compstates.forEach[
			transitions.addAll(allTransitions)
		]
		transitions.addAll(comp.transitions)
		transitions
	}
	
	override protected clearXtUmlElement(XTComponent xtObject) {
		xtObject.behaviour.top.transitions.clear
	}
	
}