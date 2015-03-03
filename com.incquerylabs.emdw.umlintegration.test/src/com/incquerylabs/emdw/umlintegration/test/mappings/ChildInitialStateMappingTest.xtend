package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.common.CompositeState
import com.zeligsoft.xtumlrt.common.InitialPoint
import org.eclipse.uml2.uml.Pseudostate
import org.eclipse.uml2.uml.PseudostateKind
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class ChildInitialStateMappingTest extends TransformationTest<Pseudostate, InitialPoint> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(RootMapping mapping) {
		val stateMachine = createStateMachine(mapping)
		val parentState = createParentState(stateMachine, "parentState")
		createPseudostate(parentState.regions.head, "childInitialState", PseudostateKind.INITIAL_LITERAL)
	}
	
	override protected getXtumlrtObjects(RootMapping mapping) {
		(mapping.xtumlrtTopState.substates.head as CompositeState).initial.asSet
	}
	
	override protected checkState(RootMapping mapping, Pseudostate umlObject, InitialPoint xtumlrtObject) {
	}
	
}