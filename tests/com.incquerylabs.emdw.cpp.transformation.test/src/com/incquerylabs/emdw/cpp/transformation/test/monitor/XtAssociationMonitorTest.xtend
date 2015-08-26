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
	XtAssociationCreationMonitorTest,
	XtAssociationDeletionMonitorTest,
	XtAssociationWithModifiedNameMonitorTest,
	XtAssociationWithModifiedBoundMonitorTest,
	XtAssociationWithModifiedTargetMonitorTest
])
@RunWith(Suite)
class XtAssociationMonitorTestSuite {}

@RunWith(Parameterized)
class XtAssociationCreationMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		_class_Ping.createXtAssociation(_class_Ping, "newAssoc", true, true, 1, 1)
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

@RunWith(Parameterized)
class XtAssociationDeletionMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		EcoreUtil.remove(_association_R1pong)
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

@RunWith(Parameterized)
class XtAssociationWithModifiedNameMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		_association_R1pong.name = '''«_association_R1pong.name»Modified'''
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

@RunWith(Parameterized)
class XtAssociationWithModifiedBoundMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		_association_R1pong.upperBound = -1
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

@RunWith(Parameterized)
class XtAssociationWithModifiedTargetMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		_association_R1pong.target = _association_R1pong.source
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}