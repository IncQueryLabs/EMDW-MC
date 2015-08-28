package com.incquerylabs.emdw.cpp.transformation.test.monitor

import java.util.Set
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	XtComponentXtClassCreateMonitorTest,
	XtComponentXtClassUpdateMonitorTest,
	XtComponentXtClassDeleteMonitorTest
])
@RunWith(Suite)
class XtComponentXtClassMonitorTestSuite {}

class XtComponentXtClassCreateMonitorTest extends XtumlMonitorBaseTest {
	
	private XTComponent dirtyComponent
	
	override protected prepareXtUmlModel(Model model) {
		val rootPackage = model.createPackage("RootPackage")
		rootPackage.createXtComponent("Component").createXtClass("Class")
		dirtyComponent = rootPackage.createXtComponent("DirtyComponent")
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		dirtyComponent.createXtClass("DirtyClass")
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertEquals(dirtyComponent, components.head)
	}
	
}

class XtComponentXtClassUpdateMonitorTest extends XtumlMonitorBaseTest {
	
	private XTComponent dirtyComponent
	
	override protected prepareXtUmlModel(Model model) {
		val rootPackage = model.createPackage("RootPackage")
		rootPackage.createXtComponent("Component").createXtClass("Class")
		dirtyComponent = rootPackage.createXtComponent("DirtyComponent")
		dirtyComponent.createXtClass("DirtyClass")
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		dirtyComponent.entities.filter(XTClass).head.createStateMachine("StateMachine")
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertEquals(dirtyComponent, components.head)
	}
	
}

class XtComponentXtClassDeleteMonitorTest extends XtumlMonitorBaseTest {
	
	private XTComponent dirtyComponent
	
	override protected prepareXtUmlModel(Model model) {
		val rootPackage = model.createPackage("RootPackage")
		rootPackage.createXtComponent("Component").createXtClass("Class")
		dirtyComponent = rootPackage.createXtComponent("DirtyComponent")
		dirtyComponent.createXtClass("DirtyClass")
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		EcoreUtil.remove(dirtyComponent.entities.filter(XTClass).head)
	}
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertEquals(dirtyComponent, components.head)
	}
	
}