package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.common.CompositeState
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.State
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class ToplevelStateMappingTest extends TransformationTest<State, com.zeligsoft.xtumlrt.common.State> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = createStateMachine(umlRoot)
		createSimpleState(stateMachine.regions.head, "state")
	}
	
	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.xtumlrtTopState.substates
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, State umlObject, com.zeligsoft.xtumlrt.common.State xtumlrtObject) {
	}

}

@RunWith(Parameterized)
class ChildStateMappingTest extends TransformationTest<State, com.zeligsoft.xtumlrt.common.State> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = createStateMachine(umlRoot)
		val parentState = createCompositeState(stateMachine, "parentState")
		createSimpleState(parentState.regions.head, "childState")
	}
	
	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.xtumlrtTopState.substates.head as CompositeState).substates
	}

	override protected checkXtumlrtObject(RootMapping mapping, State umlObject, com.zeligsoft.xtumlrt.common.State xtumlrtObject) {
	}
	
}
