package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.State
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static extension com.incquerylabs.emdw.testing.common.utils.UmlUtil.*
import static extension com.incquerylabs.emdw.testing.common.utils.XtumlUtil.*

@SuiteClasses(#[
	ToplevelStateMappingTest,
	ChildStateMappingTest
])
@RunWith(Suite)
class StateMappingTestSuite {}

class ToplevelStateMappingTest extends TransformationTest<State, org.eclipse.papyrusrt.xtumlrt.common.State> {

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = umlRoot.createStateMachine
		stateMachine.regions.head.createSimpleState("state")
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.xtumlrtTopState.substates
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, State umlObject, org.eclipse.papyrusrt.xtumlrt.common.State xtumlrtObject) {
	}

}

class ChildStateMappingTest extends TransformationTest<State, org.eclipse.papyrusrt.xtumlrt.common.State> {

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = umlRoot.createStateMachine
		val parentState = stateMachine.createCompositeState("parentState")
		parentState.regions.head.createSimpleState("childState")
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.xtumlrtTopState.substates.head as CompositeState).substates
	}

	override protected checkXtumlrtObject(RootMapping mapping, State umlObject, org.eclipse.papyrusrt.xtumlrt.common.State xtumlrtObject) {
	}
	
}
