package com.incquerylabs.emdw.cpp.transformation.test.monitor

import java.util.Set
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	OperationCreationMonitorTest,
	OperationDeletionMonitorTest,
	OperationWithModifiedNameMonitorTest,
	OperationWithModifiedAbstractionMonitorTest,
	OperationWithModifiedStaticMonitorTest,
	OperationWithNewParameterMonitorTest
])
@RunWith(Suite)
class OperationMonitorTestSuite {}

class OperationCreationMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_class_Ping.createOperation(VisibilityKind.PROTECTED, true, _type_boolean, "isEverythingOk", "C++", "return true;")
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

class OperationDeletionMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		EcoreUtil.remove(_operation_setIsPlaying)
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

class OperationWithModifiedNameMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_operation_setIsPlaying.name = '''«_operation_setIsPlaying.name»Modified'''
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

class OperationWithModifiedAbstractionMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_operation_setIsPlaying.abstract = true
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

class OperationWithModifiedStaticMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_operation_setIsPlaying.static = true
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

class OperationWithNewParameterMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_operation_setIsPlaying.parameters += createParameter(_type_integer, "code", DirectionKind.IN)
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}