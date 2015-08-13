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
class TransitionCreationMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		_compositestate_ping.createTransition(_initialpoint_ping_Initial, _simplestate_ping_S2, "otherInit")
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

@RunWith(Parameterized)
class TransitionDeletionMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		EcoreUtil.remove(_transition_ping_E1)
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

@RunWith(Parameterized)
class TransitionWithModifiedNameMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		_transition_ping_E1.name = '''«_transition_ping_E1.name»Modified'''
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

@RunWith(Parameterized)
class TransitionWithModifiedSourceVertexMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		_transition_ping_E1.sourceVertex = _transition_ping_E1.targetVertex
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

@RunWith(Parameterized)
class TransitionWithModifiedTargetVertexMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		_transition_ping_E1.targetVertex = _transition_ping_E1.sourceVertex
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}