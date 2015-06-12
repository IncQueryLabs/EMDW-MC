package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.papyrusrt.xtumlrt.common.DeepHistory
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Pseudostate
import org.eclipse.uml2.uml.PseudostateKind
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class ToplevelDeepHistoryMappingTest extends TransformationTest<Pseudostate, DeepHistory> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = createStateMachine(umlRoot)
		createPseudostate(stateMachine.regions.head, "deepHistory", PseudostateKind.DEEP_HISTORY_LITERAL)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.xtumlrtTopState.deepHistory.asSet
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Pseudostate umlObject, DeepHistory xtumlrtObject) {
	}
	
}

@RunWith(Parameterized)
class ChildDeepHistoryMappingTest extends TransformationTest<Pseudostate, DeepHistory> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = createStateMachine(umlRoot)
		val parentState = createCompositeState(stateMachine, "parentState")
		createPseudostate(parentState.regions.head, "childDeepHistory", PseudostateKind.DEEP_HISTORY_LITERAL)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.xtumlrtTopState.substates.head as CompositeState).deepHistory.asSet
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Pseudostate umlObject, DeepHistory xtumlrtObject) {
	}
	
}