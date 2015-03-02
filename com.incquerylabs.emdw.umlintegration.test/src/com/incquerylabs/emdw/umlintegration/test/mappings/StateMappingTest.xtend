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
		
		val mapping = prepareEmptyModel(testId)
		
		val stateMachine = modelBuilder.createStateMachine(mapping)
		val state = modelBuilder.prepareState(stateMachine, "foo")
				
		mapping.initializeTransformation
		executeTransformation

		mapping.assertMapping(state)
		
		endTest(testId)
	}
	
	static def getTargetStates(RootMapping mapping) {
		mapping.xtumlrtRoot.entities.head.behaviour.top.substates
	}

	static def assertMapping(RootMapping mapping, State state) {
		val targetStates = mapping.targetStates
		assertFalse("State not transformed", targetStates.empty)
		val targetState = targetStates.head
		val trace = mapping.traces.findFirst[umlElements.contains(state)]
		assertNotNull("Trace not created", trace)
		assertEquals("Trace is not complete (umlElements)", #[state], trace.umlElements)
		assertEquals("Trace is not complete (xtumlrtElements)", #[targetState], trace.xtumlrtElements)
		targetState
	}

	@Test
	def incremental() {
		val testId = "incremental"
		startTest(testId)
		
		val mapping = prepareEmptyModel(testId)
				
		mapping.initializeTransformation
		executeTransformation

		val stateMachine = modelBuilder.createStateMachine(mapping)
		val state = modelBuilder.prepareState(stateMachine, "foo")
		executeTransformation

		mapping.assertMapping(state)
		
		endTest(testId)
	}

	@Test
	def remove() {
		val testId = "remove"
		startTest(testId)
		
		val mapping = prepareEmptyModel(testId)
		val stateMachine = modelBuilder.createStateMachine(mapping)
		val state = modelBuilder.prepareState(stateMachine, "foo")

		mapping.initializeTransformation
		executeTransformation

		mapping.assertMapping(state)

		info("Removing state from source model")
		stateMachine.regions.head.subvertices -= state
		executeTransformation

		assertTrue("State not removed from target model", mapping.targetStates.empty)
		assertFalse("Trace not removed", mapping.traces.exists[umlElements.contains(state)])

		endTest(testId)
	}
	
}