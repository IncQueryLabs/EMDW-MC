package com.incquerylabs.emdw.umlintegration.test.mappings

import com.zeligsoft.xtumlrt.common.CompositeState
import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import org.eclipse.uml2.uml.State
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import traceability.UmlToCommon

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
		
		val mapping = prepareEmptyModel(testId)
		
		val stateMachine = modelBuilder.createStateMachine(mapping)
		val superstate = modelBuilder.prepareSuperstate(stateMachine, "foo")
		val substate = modelBuilder.prepareSubstate(superstate, "bar")
				
		mapping.initializeTransformation
		executeTransformation

		mapping.assertMapping(superstate, substate)
		
		endTest(testId)
	}
	
	def getTargetStates(UmlToCommon mapping) {
		mapping.common.entities.head.behaviour.top.substates
	}

	def assertMapping(UmlToCommon mapping, State superstate, State substate) {
		val targetSuperstate = assertSuperstateMapping(mapping, superstate)
		val targetStates = targetSuperstate.substates
		assertFalse("State not transformed", targetStates.empty)
		val targetState = targetStates.head
		val trace = mapping.traces.findFirst[umlElements.contains(substate)]
		assertNotNull("Trace not created", trace)
		assertEquals("Trace is not complete (umlElements)", #[substate], trace.umlElements)
		assertEquals("Trace is not complete (commonElements)", #[targetState], trace.commonElements)
	}
	
	def assertSuperstateMapping(UmlToCommon mapping, State superstate) {
		val targetSuperstate = StateMappingTest.assertMapping(mapping, superstate)
		assertTrue(targetSuperstate instanceof CompositeState)
		targetSuperstate as CompositeState
	}

	@Test
	def incremental() {
		val testId = "incremental"
		startTest(testId)
		
		val mapping = prepareEmptyModel(testId)
				
		mapping.initializeTransformation
		executeTransformation

		val stateMachine = modelBuilder.createStateMachine(mapping)
		val superstate = modelBuilder.prepareSuperstate(stateMachine, "foo")
		val substate = modelBuilder.prepareSubstate(superstate, "bar")
		executeTransformation

		mapping.assertMapping(superstate, substate)
		
		endTest(testId)
	}

	@Test
	def remove() {
		val testId = "remove"
		startTest(testId)
		
		val mapping = prepareEmptyModel(testId)
		val stateMachine = modelBuilder.createStateMachine(mapping)
		val superstate = modelBuilder.prepareSuperstate(stateMachine, "foo")
		val substate = modelBuilder.prepareSubstate(superstate, "bar")

		mapping.initializeTransformation
		executeTransformation

		mapping.assertMapping(superstate, substate)

		info("Removing state from source model")
		superstate.regions.head.subvertices -= substate
		executeTransformation

		val targetSuperstate = assertSuperstateMapping(mapping, superstate)
		assertTrue("State not removed from target model", targetSuperstate.substates.empty)
		assertFalse("Trace not removed", mapping.traces.exists[umlElements.contains(substate)])

		endTest(testId)
	}
	
}