package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.uml2.uml.Pseudostate
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

@RunWith(Parameterized)
class InitialStateMappingTest extends TransformationTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	@Test
	def single() {
		val testId = "single"
		startTest(testId)
		
		val mapping = createRootMapping(testId)
		
		val stateMachine = modelBuilder.createStateMachine(mapping)
		val initialState = modelBuilder.createInitialState(stateMachine, "initialState")
				
		mapping.initializeTransformation
		executeTransformation

		mapping.assertMapping(initialState)
		
		endTest(testId)
	}
	
	def assertMapping(RootMapping mapping, Pseudostate initialState) {
		val xtumlrtInitialState = mapping.xtumlrtInitialState
		assertNotNull("Initial state not transformed", xtumlrtInitialState)
		val trace = mapping.traces.findFirst[umlElements.contains(initialState)]
		assertNotNull("Trace not created", trace)
		assertEquals("Trace is not complete (umlElements)", #[initialState], trace.umlElements)
		assertEquals("Trace is not complete (xtumlrtElements)", #[xtumlrtInitialState], trace.xtumlrtElements)
	}
	
	def getXtumlrtInitialState(RootMapping mapping) {
		mapping.xtumlrtRoot.entities.head.behaviour.top.initial
	}

	@Test
	def incremental() {
		val testId = "incremental"
		startTest(testId)
		
		val mapping = createRootMapping(testId)
				
		mapping.initializeTransformation
		executeTransformation

		val stateMachine = createStateMachine(mapping)
		val initialState = modelBuilder.createInitialState(stateMachine, "initialState")
		executeTransformation

		mapping.assertMapping(initialState)
		
		endTest(testId)
	}

	@Test
	def remove() {
		val testId = "remove"
		startTest(testId)
		
		val mapping = createRootMapping(testId)
		
		val stateMachine = createStateMachine(mapping)
		val initialState = modelBuilder.createInitialState(stateMachine, "initialState")

		mapping.initializeTransformation
		executeTransformation

		mapping.assertMapping(initialState)

		info("Removing initial state from uml model")
		stateMachine.regions.head.subvertices -= initialState
		executeTransformation

		assertNull("Initial state not removed from xtumlrt model", mapping.xtumlrtInitialState)
		assertFalse("Trace not removed", mapping.traces.exists[umlElements.contains(initialState)])

		endTest(testId)
	}
	
}