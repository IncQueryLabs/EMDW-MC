package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.uml2.uml.State
import org.eclipse.uml2.uml.Transition
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

@RunWith(Parameterized)
class TransitionMappingTest extends TransformationTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	@Test
	def single() {
		val testId = "single"
		startTest(testId)
		
		val mapping = prepareEmptyModel(testId)
		val stateMachine = modelBuilder.createStateMachine(mapping)
		val sourceState = modelBuilder.prepareState(stateMachine, "source")
		val targetState = modelBuilder.prepareState(stateMachine, "target")
		val transition = modelBuilder.prepareTransition(stateMachine, sourceState, "foo", targetState)
				
		mapping.initializeTransformation
		executeTransformation

		mapping.assertMapping(transition, sourceState, targetState)
		
		endTest(testId)
	}
	
	def assertMapping(RootMapping mapping, Transition umlTransition, State umlSourceState, State umlTargetState) {
		val targetTransitions = mapping.targetTransitions
		assertFalse("Transition not transformed", targetTransitions.empty)
		val xtumlrtTransition = targetTransitions.head
		val trace = mapping.traces.findFirst[umlElements.contains(umlTransition)]
		assertNotNull("Trace not created", trace)
		assertEquals("Trace is not complete (umlElements)", #[umlTransition], trace.umlElements)
		assertEquals("Trace is not complete (xtumlrtElements)", #[xtumlrtTransition], trace.xtumlrtElements)
		
		val xtumlrtSourceState = mapping.traces.findFirst[umlElements.contains(umlSourceState)].xtumlrtElements.head
		val xtumlrtTargetState = mapping.traces.findFirst[umlElements.contains(umlTargetState)].xtumlrtElements.head
		assertEquals("Transition source transition", xtumlrtSourceState, xtumlrtTransition.sourceVertex)
		assertEquals("Transition target transition", xtumlrtTargetState, xtumlrtTransition.targetVertex)
		
	}

	def getTargetTransitions(RootMapping mapping) {
		mapping.xtumlrtRoot.entities.head.behaviour.top.transitions
	}
	
	@Test
	def incremental() {
		val testId = "incremental"
		startTest(testId)
		
		val mapping = prepareEmptyModel(testId)
				
		mapping.initializeTransformation
		executeTransformation

		val stateMachine = modelBuilder.createStateMachine(mapping)
		val sourceState = modelBuilder.prepareState(stateMachine, "source")
		val targetState = modelBuilder.prepareState(stateMachine, "target")
		val transition = modelBuilder.prepareTransition(stateMachine, sourceState, "foo", targetState)
		executeTransformation

		mapping.assertMapping(transition, sourceState, targetState)
		
		endTest(testId)
	}

	@Test
	def remove() {
		val testId = "remove"
		startTest(testId)
		
		val mapping = prepareEmptyModel(testId)
		val stateMachine = modelBuilder.createStateMachine(mapping)
		val sourceState = modelBuilder.prepareState(stateMachine, "source")
		val targetState = modelBuilder.prepareState(stateMachine, "target")
		val transition = modelBuilder.prepareTransition(stateMachine, sourceState, "foo", targetState)
				
		mapping.initializeTransformation
		executeTransformation

		mapping.assertMapping(transition, sourceState, targetState)

		info("Removing transition from source model")
		stateMachine.regions.head.transitions -= transition
		executeTransformation

		assertTrue("Transition not removed from target model", mapping.targetTransitions.empty)
		assertFalse("Trace not removed", mapping.traces.exists[umlElements.contains(transition)])

		endTest(testId)
	}
	
}