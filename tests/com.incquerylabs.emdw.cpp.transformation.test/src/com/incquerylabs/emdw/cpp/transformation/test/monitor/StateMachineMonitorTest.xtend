package com.incquerylabs.emdw.cpp.transformation.test.monitor

import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import java.util.Set
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

@RunWith(Parameterized)
class StateMachineCreationMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		_class_TableUser.createStateMachine("newStateMachine")
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

@RunWith(Parameterized)
class StateMachineDeletionMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		EcoreUtil.remove(_statemachine_Ping_SM)
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

@RunWith(Parameterized)
class StateMachineWithModifiedNameMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		_statemachine_Ping_SM.name = '''«_statemachine_Ping_SM.name»Modified'''
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}