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
import org.eclipse.uml2.uml.Model

@RunWith(Parameterized)
class ToplevelExitPointMappingTest extends TransformationTest<Pseudostate, ExitPoint> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = createStateMachine(umlRoot)
		createPseudostate(stateMachine.regions.head, "exitState", PseudostateKind.EXIT_POINT_LITERAL)
	}
	
	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.xtumlrtTopState.exitPoints
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Pseudostate umlObject, ExitPoint xtumlrtObject) {
	}
	
}

@RunWith(Parameterized)
class ChildExitPointMappingTest extends TransformationTest<Pseudostate, ExitPoint> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = createStateMachine(umlRoot)
		val parentState = createCompositeState(stateMachine, "parentState")
		createPseudostate(parentState.regions.head, "childExitPoint", PseudostateKind.EXIT_POINT_LITERAL)
	}
	
	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.xtumlrtTopState.substates.head as CompositeState).exitPoints
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Pseudostate umlObject, ExitPoint xtumlrtObject) {
	}
	
}