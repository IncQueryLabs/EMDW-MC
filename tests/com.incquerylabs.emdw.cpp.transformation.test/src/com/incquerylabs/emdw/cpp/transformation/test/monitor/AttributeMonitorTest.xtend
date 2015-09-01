package com.incquerylabs.emdw.cpp.transformation.test.monitor

import java.util.Set
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	AttributeCreationMonitorTest,
	AttributeDeletionMonitorTest,
	AttributeWithModifiedNameMonitorTest,
	AttributeWithModifiedBoundMonitorTest,
	AttributeWithModifiedVisibilityMonitorTest,
	AttributeWithModifiedTypeMonitorTest
])
@RunWith(Suite)
class AttributeMonitorTestSuite {}

class AttributeCreationMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_class_Ping.createSingleAttribute(_type_integer, VisibilityKind.PROTECTED, true, "newAttribute")
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertEquals(_component_PingPong, components.head)
	}
	
}

class AttributeDeletionMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		EcoreUtil.remove(_attribute_isPlaying)
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertEquals(_component_PingPong, components.head)
	}
	
}

class AttributeWithModifiedNameMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_attribute_isPlaying.name = '''«_attribute_isPlaying.name»Modified'''
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertEquals(_component_PingPong, components.head)
	}
	
}

class AttributeWithModifiedBoundMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_attribute_isPlaying.upperBound = -1
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertEquals(_component_PingPong, components.head)
	}
	
}

class AttributeWithModifiedVisibilityMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_attribute_isPlaying.visibility = VisibilityKind.PUBLIC
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertEquals(_component_PingPong, components.head)
	}
	
}

class AttributeWithModifiedTypeMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_attribute_isPlaying.type = _type_integer
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertEquals(_component_PingPong, components.head)
	}
	
}