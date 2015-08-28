package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.papyrusrt.xtumlrt.common.ExitPoint
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Pseudostate
import org.eclipse.uml2.uml.PseudostateKind
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	ToplevelExitPointMappingTest,
	ChildExitPointMappingTest
])
@RunWith(Suite)
class ExitPointMappingTestSuite {}

class ToplevelExitPointMappingTest extends TransformationTest<Pseudostate, ExitPoint> {

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = umlRoot.createStateMachine
		stateMachine.regions.head.createPseudostate("exitState", PseudostateKind.EXIT_POINT_LITERAL)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.xtumlrtTopState.exitPoints
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Pseudostate umlObject, ExitPoint xtumlrtObject) {
	}
	
}

class ChildExitPointMappingTest extends TransformationTest<Pseudostate, ExitPoint> {

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = umlRoot.createStateMachine
		val parentState = stateMachine.createCompositeState("parentState")
		parentState.regions.head.createPseudostate("childExitPoint", PseudostateKind.EXIT_POINT_LITERAL)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.xtumlrtTopState.substates.head as CompositeState).exitPoints
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Pseudostate umlObject, ExitPoint xtumlrtObject) {
	}
	
}