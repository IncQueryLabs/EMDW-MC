package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.common.CompositeState
import org.eclipse.uml2.uml.State
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

@RunWith(Parameterized)
class ChildStateMappingTest extends TransformationTest {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	@Test
	def single() {
		val testId = "single"
		startTest(testId)

		val mapping = createRootMapping(testId)

		val stateMachine = modelBuilder.createStateMachine(mapping)
		val parentState = modelBuilder.createParentState(stateMachine, "parentState")
		val childState = modelBuilder.createChildState(parentState, "childState")

		mapping.initializeTransformation
		executeTransformation

		mapping.assertMapping(parentState, childState)

		endTest(testId)
	}

	def getXtumlrtStates(RootMapping mapping) {
		mapping.xtumlrtRoot.entities.head.behaviour.top.substates
	}

	def assertMapping(RootMapping mapping, State parentState, State childState) {
		val xtumlrtSuperstate = assertParentStateMapping(mapping, parentState)
		val xtumlrtStates = xtumlrtSuperstate.substates
		assertFalse("State not transformed", xtumlrtStates.empty)
		val xtumlrtState = xtumlrtStates.head
		val trace = mapping.traces.findFirst[umlElements.contains(childState)]
		assertNotNull("Trace not created", trace)
		assertEquals("Trace is not complete (umlElements)", #[childState], trace.umlElements)
		assertEquals("Trace is not complete (xtumlrtElements)", #[xtumlrtState], trace.xtumlrtElements)
	}

	def assertParentStateMapping(RootMapping mapping, State parentState) {
		val xtumlrtSuperstate = StateMappingTest.assertMapping(mapping, parentState)
		assertTrue(xtumlrtSuperstate instanceof CompositeState)
		xtumlrtSuperstate as CompositeState
	}

	@Test
	def incremental() {
		val testId = "incremental"
		startTest(testId)

		val mapping = createRootMapping(testId)

		mapping.initializeTransformation
		executeTransformation

		val stateMachine = modelBuilder.createStateMachine(mapping)
		val parentState = modelBuilder.createParentState(stateMachine, "parentState")
		val childState = modelBuilder.createChildState(parentState, "childState")
		executeTransformation

		mapping.assertMapping(parentState, childState)

		endTest(testId)
	}

	@Test
	def remove() {
		val testId = "remove"
		startTest(testId)

		val mapping = createRootMapping(testId)
		val stateMachine = modelBuilder.createStateMachine(mapping)
		val parentState = modelBuilder.createParentState(stateMachine, "parentState")
		val childState = modelBuilder.createChildState(parentState, "childState")

		mapping.initializeTransformation
		executeTransformation

		mapping.assertMapping(parentState, childState)

		info("Removing state from uml model")
		parentState.regions.head.subvertices -= childState
		executeTransformation

		val xtumlrtSuperstate = assertParentStateMapping(mapping, parentState)
		assertTrue("State not removed from xtumlrt model", xtumlrtSuperstate.substates.empty)
		assertFalse("Trace not removed", mapping.traces.exists[umlElements.contains(childState)])

		endTest(testId)
	}

}
