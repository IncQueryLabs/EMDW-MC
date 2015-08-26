package com.incquerylabs.emdw.cpp.transformation.test.monitor

import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import java.util.Set
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

@SuiteClasses(#[
	SimpleStateCreationMonitorTest,
	SimpleStateDeletionMonitorTest,
	SimpleStateWithModifiedNameMonitorTest,
	CompositeStateCreationMonitorTest,
	CompositeStateDeletionMonitorTest,
	CompositeStateWithModifiedNameMonitorTest
])
@RunWith(Suite)
class VertexMonitorTestSuite {}

@RunWith(Parameterized)
class SimpleStateCreationMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		_compositestate_ping.createSimpleState("newState")
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

@RunWith(Parameterized)
class SimpleStateDeletionMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		EcoreUtil.remove(_simplestate_ping_S1)
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

@RunWith(Parameterized)
class CompositeStateCreationMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		_compositestate_ping.createCompositeState("newCompositeState")
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

@RunWith(Parameterized)
class CompositeStateDeletionMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		EcoreUtil.remove(_compositestate_ping)
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

@RunWith(Parameterized)
class SimpleStateWithModifiedNameMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		_simplestate_ping_S1.name = '''«_simplestate_ping_S1.name»Modified'''
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

@RunWith(Parameterized)
class CompositeStateWithModifiedNameMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		_compositestate_ping.name = '''«_compositestate_ping.name»Modified'''
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}