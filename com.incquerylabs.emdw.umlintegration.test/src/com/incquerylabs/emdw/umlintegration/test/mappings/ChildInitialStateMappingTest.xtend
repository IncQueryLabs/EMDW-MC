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
class ChildInitialStateMappingTest extends TransformationTest {
	
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
		val childInitialState = modelBuilder.createChildInitialState(parentState, "childInitialState")
				
		mapping.initializeTransformation
		executeTransformation

		mapping.assertMapping(childInitialState)
		
		endTest(testId)
	}
	
	def assertMapping(RootMapping mapping, Pseudostate initialChildState) {
		val xtumlrtInitialState = mapping.xtumlrtInitialState
		assertNotNull("Initial state not transformed", xtumlrtInitialState)
		val trace = mapping.traces.findFirst[umlElements.contains(initialChildState)]
		assertNotNull("Trace not created", trace)
		assertEquals("Trace is not complete (umlElements)", #[initialChildState], trace.umlElements)
		assertEquals("Trace is not complete (xtumlrtElements)", #[xtumlrtInitialState], trace.xtumlrtElements)
	}
	
	def getXtumlrtInitialState(RootMapping mapping) {
		(ChildStateMappingTest.getXtumlrtStates(mapping).head as CompositeState).initial
	}

	@Test
	def incremental() {
		val testId = "incremental"
		startTest(testId)
		
		val mapping = createRootMapping(testId)
				
		mapping.initializeTransformation
		executeTransformation

		val stateMachine = createStateMachine(mapping)
		val parentState = modelBuilder.createParentState(stateMachine, "parentState")
		val initialChildState = modelBuilder.createChildInitialState(parentState, "initialChildState")
		executeTransformation

		mapping.assertMapping(initialChildState)
		
		endTest(testId)
	}

	@Test
	def remove() {
		val testId = "remove"
		startTest(testId)
		
		val mapping = createRootMapping(testId)
		
		val stateMachine = createStateMachine(mapping)
		val parentState = modelBuilder.createParentState(stateMachine, "parentState")
		val initialChildState = modelBuilder.createChildInitialState(parentState, "initialChildState")

		mapping.initializeTransformation
		executeTransformation

		mapping.assertMapping(initialChildState)

		info("Removing initial state from uml model")
		parentState.regions.head.subvertices -= initialChildState
		executeTransformation

		assertNull("Initial state not removed from xtumlrt model", mapping.xtumlrtInitialState)
		assertFalse("Trace not removed", mapping.traces.exists[umlElements.contains(initialChildState)])

		endTest(testId)
	}
	
}