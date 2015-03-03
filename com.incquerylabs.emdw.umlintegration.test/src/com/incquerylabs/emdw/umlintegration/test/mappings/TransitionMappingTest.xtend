package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.uml2.uml.Transition
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*
import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class TransitionMappingTest extends TransformationTest<Transition, com.zeligsoft.xtumlrt.common.Transition> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(RootMapping mapping) {
		val stateMachine = createStateMachine(mapping)
		val sourceState = createState(stateMachine.regions.head, "source")
		val targetState = createState(stateMachine.regions.head, "target")
		createTransition(stateMachine.regions.head, "transition", sourceState, targetState)
	}
	
	override protected getXtumlrtObjects(RootMapping mapping) {
		mapping.xtumlrtTopState.transitions
	}
	
	override protected checkState(RootMapping mapping, Transition umlObject, com.zeligsoft.xtumlrt.common.Transition xtumlrtObject) {
		checkTransition(mapping, umlObject, xtumlrtObject)
	}
	
	static def checkTransition(RootMapping mapping, Transition umlObject, com.zeligsoft.xtumlrt.common.Transition xtumlrtObject) {
		val xtumlrtSourceState = mapping.traces.findFirst[umlElements.contains(umlObject.source)].xtumlrtElements.head
		val xtumlrtTargetState = mapping.traces.findFirst[umlElements.contains(umlObject.target)].xtumlrtElements.head
		assertEquals("Transition source transition", xtumlrtSourceState, xtumlrtObject.sourceVertex)
		assertEquals("Transition target transition", xtumlrtTargetState, xtumlrtObject.targetVertex)
	}
	
}