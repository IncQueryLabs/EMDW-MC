package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.papyrusrt.xtumlrt.common.InitialPoint
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Pseudostate
import org.eclipse.uml2.uml.PseudostateKind
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	ToplevelInitialPointMappingTest,
	ChildInitialPointMappingTest
])
@RunWith(Suite)
class InitialPointMappingTestSuite {}

class ToplevelInitialPointMappingTest extends TransformationTest<Pseudostate, InitialPoint> {

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = umlRoot.createStateMachine
		stateMachine.regions.head.createPseudostate("initialState", PseudostateKind.INITIAL_LITERAL)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.xtumlrtTopState.initial.asSet
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Pseudostate umlObject, InitialPoint xtumlrtObject) {
	}
	
}

class ChildInitialPointMappingTest extends TransformationTest<Pseudostate, InitialPoint> {

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = umlRoot.createStateMachine
		val parentState = stateMachine.createCompositeState("parentState")
		parentState.regions.head.createPseudostate("childInitialPoint", PseudostateKind.INITIAL_LITERAL)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.xtumlrtTopState.substates.head as CompositeState).initial.asSet
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Pseudostate umlObject, InitialPoint xtumlrtObject) {
	}
	
}