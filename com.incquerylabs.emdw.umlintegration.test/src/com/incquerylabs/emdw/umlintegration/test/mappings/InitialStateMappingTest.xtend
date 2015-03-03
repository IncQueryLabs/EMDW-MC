package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.common.InitialPoint
import org.eclipse.uml2.uml.Pseudostate
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class InitialStateMappingTest extends TransformationTest<Pseudostate, InitialPoint> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(RootMapping mapping) {
		val stateMachine = createStateMachine(mapping)
		createInitialState(stateMachine.regions.head, "initialState")
	}
	
	override protected getXtumlrtObjects(RootMapping mapping) {
		mapping.xtumlrtTopState.initial.asSet
	}
	
	override protected checkState(RootMapping mapping, Pseudostate umlObject, InitialPoint xtumlrtObject) {
	}
	
}