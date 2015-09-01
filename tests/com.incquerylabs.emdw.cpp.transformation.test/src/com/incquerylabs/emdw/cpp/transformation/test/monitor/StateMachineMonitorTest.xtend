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
	StateMachineCreationMonitorTest,
	StateMachineDeletionMonitorTest,
	StateMachineWithModifiedNameMonitorTest
])
@RunWith(Suite)
class StateMachineMonitorTestSuite {}

class StateMachineCreationMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_class_TableUser.createStateMachine("newStateMachine")
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

class StateMachineDeletionMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		EcoreUtil.remove(_statemachine_Ping_SM)
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

class StateMachineWithModifiedNameMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_statemachine_Ping_SM.name = '''«_statemachine_Ping_SM.name»Modified'''
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}