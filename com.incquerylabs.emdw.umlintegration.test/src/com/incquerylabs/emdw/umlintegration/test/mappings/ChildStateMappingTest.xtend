package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.common.CompositeState
import org.eclipse.uml2.uml.State
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class ChildStateMappingTest extends TransformationTest<State, com.zeligsoft.xtumlrt.common.State> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(RootMapping mapping) {
		val stateMachine = createStateMachine(mapping)
		val parentState = createParentState(stateMachine, "parentState")
		createState(parentState.regions.head, "childState")
	}
	
	override protected getXtumlrtObjects(RootMapping mapping) {
		(mapping.xtumlrtTopState.substates.head as CompositeState).substates
	}

	override protected checkState(RootMapping mapping, State umlObject, com.zeligsoft.xtumlrt.common.State xtumlrtObject) {
	}
	
}
