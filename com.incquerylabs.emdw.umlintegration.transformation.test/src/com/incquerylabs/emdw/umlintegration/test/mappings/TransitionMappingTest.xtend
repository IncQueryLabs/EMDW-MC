package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Transition
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class ToplevelTransitionMappingTest extends TransformationTest<Transition, org.eclipse.papyrusrt.xtumlrt.common.Transition> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		createTransition(umlRoot)
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.xtumlrtTopState.transitions
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Transition umlObject, org.eclipse.papyrusrt.xtumlrt.common.Transition xtumlrtObject) {
		checkTransition(mapping, umlObject, xtumlrtObject)
	}
	
}

@RunWith(Parameterized)
class ChildTransitionMappingTest extends TransformationTest<Transition, org.eclipse.papyrusrt.xtumlrt.common.Transition> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = createStateMachine(umlRoot)
		val parentState = createCompositeState(stateMachine, "parentState")
		val sourceState = createSimpleState(parentState.regions.head, "source")
		val targetState = createSimpleState(parentState.regions.head, "target")
		createTransition(parentState.regions.head, "transition", sourceState, targetState)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.xtumlrtTopState.substates.head as CompositeState).transitions
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Transition umlObject, org.eclipse.papyrusrt.xtumlrt.common.Transition xtumlrtObject) {
		checkTransition(mapping, umlObject, xtumlrtObject)
	}

}