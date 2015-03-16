package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.common.InitialPoint
import org.eclipse.uml2.uml.Pseudostate
import org.eclipse.uml2.uml.PseudostateKind
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import com.zeligsoft.xtumlrt.common.CompositeState
import org.eclipse.uml2.uml.Model

@RunWith(Parameterized)
class ToplevelInitialPointMappingTest extends TransformationTest<Pseudostate, InitialPoint> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = createStateMachine(umlRoot)
		createPseudostate(stateMachine.regions.head, "initialState", PseudostateKind.INITIAL_LITERAL)
	}
	
	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.xtumlrtTopState.initial.asSet
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Pseudostate umlObject, InitialPoint xtumlrtObject) {
	}
	
}

@RunWith(Parameterized)
class ChildInitialPointMappingTest extends TransformationTest<Pseudostate, InitialPoint> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = createStateMachine(umlRoot)
		val parentState = createCompositeState(stateMachine, "parentState")
		createPseudostate(parentState.regions.head, "childInitialPoint", PseudostateKind.INITIAL_LITERAL)
	}
	
	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.xtumlrtTopState.substates.head as CompositeState).initial.asSet
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Pseudostate umlObject, InitialPoint xtumlrtObject) {
	}
	
}