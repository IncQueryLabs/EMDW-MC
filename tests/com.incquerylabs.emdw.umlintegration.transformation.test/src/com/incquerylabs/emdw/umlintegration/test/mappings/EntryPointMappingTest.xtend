package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.papyrusrt.xtumlrt.common.EntryPoint
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Pseudostate
import org.eclipse.uml2.uml.PseudostateKind
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static extension com.incquerylabs.emdw.testing.common.utils.UmlUtil.*
import static extension com.incquerylabs.emdw.testing.common.utils.XtumlUtil.*

@SuiteClasses(#[
	ToplevelEntryPointMappingTest,
	ChildEntryPointMappingTest
])
@RunWith(Suite)
class EntryPointMappingTestSuite {}

class ToplevelEntryPointMappingTest extends TransformationTest<Pseudostate, EntryPoint> {

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = umlRoot.createStateMachine
		stateMachine.regions.head.createPseudostate("entryState", PseudostateKind.ENTRY_POINT_LITERAL)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.xtumlrtTopState.entryPoints
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Pseudostate umlObject, EntryPoint xtumlrtObject) {
	}
	
}

class ChildEntryPointMappingTest extends TransformationTest<Pseudostate, EntryPoint> {

	override protected createUmlObject(Model umlRoot) {
		val stateMachine = umlRoot.createStateMachine
		val parentState = stateMachine.createCompositeState("parentState")
		parentState.regions.head.createPseudostate("childEntryPoint", PseudostateKind.ENTRY_POINT_LITERAL)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.xtumlrtTopState.substates.head as CompositeState).entryPoints
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Pseudostate umlObject, EntryPoint xtumlrtObject) {
	}
	
}