package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.common.ExitPoint
import org.eclipse.uml2.uml.Pseudostate
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import org.eclipse.uml2.uml.PseudostateKind
import com.zeligsoft.xtumlrt.common.CompositeState

@RunWith(Parameterized)
class ToplevelExitPointMappingTest extends TransformationTest<Pseudostate, ExitPoint> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(RootMapping mapping) {
		val stateMachine = createStateMachine(mapping)
		createPseudostate(stateMachine.regions.head, "exitState", PseudostateKind.EXIT_POINT_LITERAL)
	}
	
	override protected getXtumlrtObjects(RootMapping mapping) {
		mapping.xtumlrtTopState.exitPoints
	}
	
	override protected checkState(RootMapping mapping, Pseudostate umlObject, ExitPoint xtumlrtObject) {
	}
	
}

@RunWith(Parameterized)
class ChildExitPointMappingTest extends TransformationTest<Pseudostate, ExitPoint> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(RootMapping mapping) {
		val stateMachine = createStateMachine(mapping)
		val parentState = createParentState(stateMachine, "parentState")
		createPseudostate(parentState.regions.head, "childExitPoint", PseudostateKind.EXIT_POINT_LITERAL)
	}
	
	override protected getXtumlrtObjects(RootMapping mapping) {
		(mapping.xtumlrtTopState.substates.head as CompositeState).exitPoints
	}
	
	override protected checkState(RootMapping mapping, Pseudostate umlObject, ExitPoint xtumlrtObject) {
	}
	
}