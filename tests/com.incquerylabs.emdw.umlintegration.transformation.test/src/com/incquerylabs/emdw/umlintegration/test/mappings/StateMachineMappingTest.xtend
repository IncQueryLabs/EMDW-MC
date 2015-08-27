package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.StateMachine
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static extension com.incquerylabs.emdw.testing.common.utils.ModelUtil.*
import static extension com.incquerylabs.emdw.testing.common.utils.UmlUtil.*

@SuiteClasses(#[
	StateMachineMappingTest
])
@RunWith(Suite)
class StateMachineMappingTestSuite {}

class StateMachineMappingTest extends TransformationTest<StateMachine, org.eclipse.papyrusrt.xtumlrt.common.StateMachine> {

	override protected createUmlObject(Model umlRoot) {
		umlRoot.createStateMachine
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.head.behaviour.asSet
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, StateMachine umlObject, org.eclipse.papyrusrt.xtumlrt.common.StateMachine xtumlrtObject) {
	}

}