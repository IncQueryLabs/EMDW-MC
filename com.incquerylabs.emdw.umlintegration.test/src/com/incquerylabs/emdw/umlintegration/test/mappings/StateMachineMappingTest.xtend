package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.uml2.uml.StateMachine
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class StateMachineMappingTest extends TransformationTest<StateMachine, com.zeligsoft.xtumlrt.common.StateMachine> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(RootMapping mapping) {
		createStateMachine(mapping)
	}
	
	override protected getXtumlrtObjects(RootMapping mapping) {
		mapping.xtumlrtRoot.topEntities.head.behaviour.asSet
	}
	
	override protected checkState(RootMapping mapping, StateMachine umlObject, com.zeligsoft.xtumlrt.common.StateMachine xtumlrtObject) {
	}

}