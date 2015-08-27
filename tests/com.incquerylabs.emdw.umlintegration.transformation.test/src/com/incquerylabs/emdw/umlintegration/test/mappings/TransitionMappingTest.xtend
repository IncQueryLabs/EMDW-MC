package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Transition

import static extension com.incquerylabs.emdw.testing.common.utils.UmlUtil.*
import static extension com.incquerylabs.emdw.testing.common.utils.XtumlUtil.*

class ToplevelTransitionMappingTest extends TransformationTest<Transition, org.eclipse.papyrusrt.xtumlrt.common.Transition> {

	override protected createUmlObject(Model umlRoot) {
		umlRoot.createTransition
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.xtumlrtTopState.transitions
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Transition umlObject, org.eclipse.papyrusrt.xtumlrt.common.Transition xtumlrtObject) {
		checkTransition(mapping, umlObject, xtumlrtObject)
	}
	
}

class ChildTransitionMappingTest extends TransformationTest<Transition, org.eclipse.papyrusrt.xtumlrt.common.Transition> {

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = umlRoot.createStateMachine
		val parentState = stateMachine.createCompositeState("parentState")
		val sourceState = parentState.regions.head.createSimpleState("source")
		val targetState = parentState.regions.head.createSimpleState("target")
		parentState.regions.head.createTransition("transition", sourceState, targetState)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.xtumlrtTopState.substates.head as CompositeState).transitions
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Transition umlObject, org.eclipse.papyrusrt.xtumlrt.common.Transition xtumlrtObject) {
		checkTransition(mapping, umlObject, xtumlrtObject)
	}

}