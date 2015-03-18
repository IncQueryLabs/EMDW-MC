package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.common.CompositeState
import com.zeligsoft.xtumlrt.common.JunctionPoint
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Pseudostate
import org.eclipse.uml2.uml.PseudostateKind
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class ToplevelJunctionPointMappingTest extends TransformationTest<Pseudostate, JunctionPoint> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = createStateMachine(umlRoot)
		createPseudostate(stateMachine.regions.head, "junctionState", PseudostateKind.JUNCTION_LITERAL)
	}
	
	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.xtumlrtTopState.junctionPoints
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Pseudostate umlObject, JunctionPoint xtumlrtObject) {
	}
	
}

@RunWith(Parameterized)
class ChildJunctionPointMappingTest extends TransformationTest<Pseudostate, JunctionPoint> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = createStateMachine(umlRoot)
		val parentState = createCompositeState(stateMachine, "parentState")
		createPseudostate(parentState.regions.head, "childJunctionPoint", PseudostateKind.JUNCTION_LITERAL)
	}
	
	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.xtumlrtTopState.substates.head as CompositeState).junctionPoints
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Pseudostate umlObject, JunctionPoint xtumlrtObject) {
	}
	
}