package com.incquerylabs.emdw.cpp.transformation.test.monitor

import java.util.Set
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	TransitionCreationMonitorTest,
	TransitionDeletionMonitorTest,
	TransitionWithModifiedNameMonitorTest,
	TransitionWithModifiedSourceVertexMonitorTest,
	TransitionWithModifiedTargetVertexMonitorTest
])
@RunWith(Suite)
class TransitionMonitorTestSuite {}

class TransitionCreationMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_compositestate_ping.createTransition(_initialpoint_ping_Initial, _simplestate_ping_S2, "otherInit")
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

class TransitionDeletionMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		EcoreUtil.remove(_transition_ping_E1)
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

class TransitionWithModifiedNameMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_transition_ping_E1.name = '''«_transition_ping_E1.name»Modified'''
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

class TransitionWithModifiedSourceVertexMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_transition_ping_E1.sourceVertex = _transition_ping_E1.targetVertex
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

class TransitionWithModifiedTargetVertexMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_transition_ping_E1.targetVertex = _transition_ping_E1.sourceVertex
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}