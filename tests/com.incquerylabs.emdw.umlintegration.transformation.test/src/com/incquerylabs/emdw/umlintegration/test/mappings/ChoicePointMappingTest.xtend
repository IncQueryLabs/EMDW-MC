package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.ChoicePoint
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Pseudostate
import org.eclipse.uml2.uml.PseudostateKind

import static extension com.incquerylabs.emdw.testing.common.utils.UmlUtil.*
import static extension com.incquerylabs.emdw.testing.common.utils.XtumlUtil.*

class ToplevelChoicePointMappingTest extends TransformationTest<Pseudostate, ChoicePoint> {

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = umlRoot.createStateMachine
		stateMachine.regions.head.createPseudostate("choiceState", PseudostateKind.CHOICE_LITERAL)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.xtumlrtTopState.choicePoints
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Pseudostate umlObject, ChoicePoint xtumlrtObject) {
	}
	
}


class ChildChoicePointMappingTest extends TransformationTest<Pseudostate, ChoicePoint> {

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = createStateMachine(umlRoot)
		val parentState = stateMachine.createCompositeState("parentState")
		parentState.regions.head.createPseudostate("childChoicePoint", PseudostateKind.CHOICE_LITERAL)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.xtumlrtTopState.substates.head as CompositeState).choicePoints
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Pseudostate umlObject, ChoicePoint xtumlrtObject) {
	}
	
}