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
	ActionCodeCreationMonitorTest,
	ActionCodeDeletionMonitorTest,
	ActionCodeWithModifiedNameMonitorTest,
	ActionCodeWithModifiedBodyMonitorTest
])
@RunWith(Suite)
class ActionCodeMonitorTestSuite{}

class ActionCodeCreationMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_actionchain_pong_e2.createActionCode("newActionCode", "C++", '''::std::cout << "Smile";''')
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

class ActionCodeDeletionMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		EcoreUtil.remove(_actioncode_ping_s2entry)
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

class ActionCodeWithModifiedNameMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_actioncode_ping_s1entry.name = '''«_actioncode_ping_s1entry.name»Modified'''
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}

class ActionCodeWithModifiedBodyMonitorTest extends XtumlMonitorWithModelBaseTest {
	
	override protected modifyXtumlModel(Model xtModel) {
		_actioncode_ping_s1entry.body.head.source = '''«_actioncode_ping_s1entry.body.head.source»;\n::std::cout << "Modified";'''
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertTrue(components.contains(_component_PingPong))
	}
	
}