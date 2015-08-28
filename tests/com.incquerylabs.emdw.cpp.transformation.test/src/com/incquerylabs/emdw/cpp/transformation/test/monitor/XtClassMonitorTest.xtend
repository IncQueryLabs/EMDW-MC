package com.incquerylabs.emdw.cpp.transformation.test.monitor

import java.util.Set
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	XtClassWithModifiedNameMonitorTest,
	XtClassMovedToPackageMonitorTest,
	XtClassMovedToOtherComponentMonitorTest
])
@RunWith(Suite)
class XtClassMonitorTestSuite {}

class XtClassWithModifiedNameMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_class_TableUser.name = '''«_class_TableUser.name»Modified'''
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

class XtClassMovedToPackageMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_component_PingPong.entities -= _class_TableUser
		_package_InnerPackage.entities += _class_TableUser
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

class XtClassMovedToOtherComponentMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_component_PingPong.entities -= _class_TableUser
		_component_Other.entities += _class_TableUser
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(2, components.size)
		assertTrue(components.contains(_component_PingPong))
		assertTrue(components.contains(_component_Other))
	}
	
}