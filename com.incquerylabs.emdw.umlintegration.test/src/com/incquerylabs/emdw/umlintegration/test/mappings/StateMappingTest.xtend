package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.uml2.uml.State
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class StateMappingTest extends TransformationTest<State, com.zeligsoft.xtumlrt.common.State> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(RootMapping mapping) {
		val stateMachine = createStateMachine(mapping)
		createState(stateMachine.regions.head, "state")
	}
	
	override protected getXtumlrtObjects(RootMapping mapping) {
		mapping.xtumlrtTopState.substates
	}
	
	override protected checkState(RootMapping mapping, State umlObject, com.zeligsoft.xtumlrt.common.State xtumlrtObject) {
	}

}