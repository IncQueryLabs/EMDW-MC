package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.StateMachine
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class StateMachineMappingTest extends TransformationTest<StateMachine, org.eclipse.papyrusrt.xtumlrt.common.StateMachine> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		createStateMachine(umlRoot)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.head.behaviour.asSet
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, StateMachine umlObject, org.eclipse.papyrusrt.xtumlrt.common.StateMachine xtumlrtObject) {
	}

}