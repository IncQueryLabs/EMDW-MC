package com.incquerylabs.emdw.cpp.transformation.test.monitor

import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import java.util.Set
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

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

@RunWith(Parameterized)
class OperationCreationMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		_class_Ping.createOperation(VisibilityKind.PROTECTED, true, _type_boolean, "isEverythingOk", "return true;")
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

@RunWith(Parameterized)
class OperationDeletionMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		EcoreUtil.remove(_operation_setIsPlaying)
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

@RunWith(Parameterized)
class OperationWithModifiedNameMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		_operation_setIsPlaying.name = '''«_operation_setIsPlaying.name»Modified'''
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

@RunWith(Parameterized)
class OperationWithModifiedAbstractionMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		_operation_setIsPlaying.abstract = true
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

@RunWith(Parameterized)
class OperationWithModifiedStaticMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		_operation_setIsPlaying.static = true
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

@RunWith(Parameterized)
class OperationWithNewParameterMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		_operation_setIsPlaying.parameters += createParameter(_type_integer, "code", DirectionKind.IN)
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}