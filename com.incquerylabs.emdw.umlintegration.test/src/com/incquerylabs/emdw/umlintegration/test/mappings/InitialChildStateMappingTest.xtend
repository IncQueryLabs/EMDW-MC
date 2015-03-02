package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.common.CompositeState
import org.eclipse.uml2.uml.Pseudostate
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

@RunWith(Parameterized)
class InitialChildStateMappingTest extends TransformationTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	@Test
	def single() {
		val testId = "single"
		startTest(testId)
		
		val mapping = prepareEmptyModel(testId)
		
		val stateMachine = modelBuilder.createStateMachine(mapping)
		val superstate = modelBuilder.prepareSuperstate(stateMachine, "foo")
		val initialState = modelBuilder.prepareInitialChildState(superstate, "initialState")
				
		mapping.initializeTransformation
		executeTransformation

		mapping.assertMapping(initialState)
		
		endTest(testId)
	}
	
	def assertMapping(RootMapping mapping, Pseudostate initialState) {
		val targetInitialState = mapping.targetInitialState
		assertNotNull("Initial state not transformed", targetInitialState)
		val trace = mapping.traces.findFirst[umlElements.contains(initialState)]
		assertNotNull("Trace not created", trace)
		assertEquals("Trace is not complete (umlElements)", #[initialState], trace.umlElements)
		assertEquals("Trace is not complete (xtumlrtElements)", #[targetInitialState], trace.xtumlrtElements)
	}
	
	def getTargetInitialState(RootMapping mapping) {
		(mapping.xtumlrtRoot.entities.head.behaviour.top.substates.head as CompositeState).initial
	}

	@Test
	def incremental() {
		val testId = "incremental"
		startTest(testId)
		
		val mapping = prepareEmptyModel(testId)
				
		mapping.initializeTransformation
		executeTransformation

		val stateMachine = createStateMachine(mapping)
		val superstate = modelBuilder.prepareSuperstate(stateMachine, "foo")
		val initialState = modelBuilder.prepareInitialChildState(superstate, "initialState")
		executeTransformation

		mapping.assertMapping(initialState)
		
		endTest(testId)
	}

	@Test
	def remove() {
		val testId = "remove"
		startTest(testId)
		
		val mapping = prepareEmptyModel(testId)
		
		val stateMachine = createStateMachine(mapping)
		val superstate = modelBuilder.prepareSuperstate(stateMachine, "foo")
		val initialState = modelBuilder.prepareInitialChildState(superstate, "initialState")

		mapping.initializeTransformation
		executeTransformation

		mapping.assertMapping(initialState)

		info("Removing initial state from source model")
		superstate.regions.head.subvertices -= initialState
		executeTransformation

		assertNull("Initial state not removed from target model", mapping.targetInitialState)
		assertFalse("Trace not removed", mapping.traces.exists[umlElements.contains(initialState)])

		endTest(testId)
	}
	
}