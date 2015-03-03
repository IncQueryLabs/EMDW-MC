package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.common.CompositeState
import org.eclipse.uml2.uml.Transition
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class ChildTransitionMappingTest extends TransformationTest<Transition, com.zeligsoft.xtumlrt.common.Transition> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(RootMapping mapping) {
		val stateMachine = createStateMachine(mapping)
		val parentState = createParentState(stateMachine, "parentState")
		val sourceState = createState(parentState.regions.head, "source")
		val targetState = createState(parentState.regions.head, "target")
		createTransition(parentState.regions.head, "transition", sourceState, targetState)
	}
	
	override protected getXtumlrtObjects(RootMapping mapping) {
		(mapping.xtumlrtTopState.substates.head as CompositeState).transitions
	}
	
	override protected checkState(RootMapping mapping, Transition umlObject, com.zeligsoft.xtumlrt.common.Transition xtumlrtObject) {
		TransitionMappingTest.checkTransition(mapping, umlObject, xtumlrtObject)
	}

}