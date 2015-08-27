package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.papyrusrt.xtumlrt.common.DeepHistory
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Pseudostate
import org.eclipse.uml2.uml.PseudostateKind
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static extension com.incquerylabs.emdw.testing.common.utils.ModelUtil.*
import static extension com.incquerylabs.emdw.testing.common.utils.UmlUtil.*
import static extension com.incquerylabs.emdw.testing.common.utils.XtumlUtil.*

@SuiteClasses(#[
	ToplevelDeepHistoryMappingTest,
	ChildDeepHistoryMappingTest
])
@RunWith(Suite)
class DeepHistoryMappingTestSuite {}

class ToplevelDeepHistoryMappingTest extends TransformationTest<Pseudostate, DeepHistory> {

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = umlRoot.createStateMachine
		stateMachine.regions.head.createPseudostate("deepHistory", PseudostateKind.DEEP_HISTORY_LITERAL)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.xtumlrtTopState.deepHistory.asSet
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Pseudostate umlObject, DeepHistory xtumlrtObject) {
	}
	
}


class ChildDeepHistoryMappingTest extends TransformationTest<Pseudostate, DeepHistory> {

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = umlRoot.createStateMachine
		val parentState = stateMachine.createCompositeState("parentState")
		parentState.regions.head.createPseudostate("childDeepHistory", PseudostateKind.DEEP_HISTORY_LITERAL)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.xtumlrtTopState.substates.head as CompositeState).deepHistory.asSet
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Pseudostate umlObject, DeepHistory xtumlrtObject) {
	}
	
}