package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.uml2.uml.State
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

@RunWith(Parameterized)
class StateMappingTest extends TransformationTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	@Test
	def single() {
		val testId = "single"
		startTest(testId)
		
		val mapping = createRootMapping(testId)
		
		val stateMachine = modelBuilder.createStateMachine(mapping)
		val state = modelBuilder.createState(stateMachine, "state")
				
		mapping.initializeTransformation
		executeTransformation

		mapping.assertMapping(state)
		
		endTest(testId)
	}
	
	static def getXtumlrtStates(RootMapping mapping) {
		mapping.xtumlrtRoot.entities.head.behaviour.top.substates
	}

	static def assertMapping(RootMapping mapping, State state) {
		val xtumlrtStates = mapping.xtumlrtStates
		assertFalse("State not transformed", xtumlrtStates.empty)
		val xtumlrtState = xtumlrtStates.head
		val trace = mapping.traces.findFirst[umlElements.contains(state)]
		assertNotNull("Trace not created", trace)
		assertEquals("Trace is not complete (umlElements)", #[state], trace.umlElements)
		assertEquals("Trace is not complete (xtumlrtElements)", #[xtumlrtState], trace.xtumlrtElements)
		xtumlrtState
	}

	@Test
	def incremental() {
		val testId = "incremental"
		startTest(testId)
		
		val mapping = createRootMapping(testId)
				
		mapping.initializeTransformation
		executeTransformation

		val stateMachine = modelBuilder.createStateMachine(mapping)
		val state = modelBuilder.createState(stateMachine, "state")
		executeTransformation

		mapping.assertMapping(state)
		
		endTest(testId)
	}

	@Test
	def remove() {
		val testId = "remove"
		startTest(testId)
		
		val mapping = createRootMapping(testId)
		val stateMachine = modelBuilder.createStateMachine(mapping)
		val state = modelBuilder.createState(stateMachine, "state")

		mapping.initializeTransformation
		executeTransformation

		mapping.assertMapping(state)

		info("Removing state from uml model")
		stateMachine.regions.head.subvertices -= state
		executeTransformation

		assertTrue("State not removed from xtumlrt model", mapping.xtumlrtStates.empty)
		assertFalse("Trace not removed", mapping.traces.exists[umlElements.contains(state)])

		endTest(testId)
	}
	
}