package com.incquerylabs.emdw.cpp.transformation.test.monitor

import java.util.Set
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	XtComponentXtPackageCreateMonitorTest,
	XtComponentXtPackageUpdateMonitorTest,
	XtComponentXtPackageDeleteMonitorTest
])
@RunWith(Suite)
class XtComponentXtPackageMonitorTestSuite {}

class XtComponentXtPackageCreateMonitorTest extends XtumlMonitorBaseTest {
	private XTComponent dirtyComponent
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertEquals(dirtyComponent, components.head)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val rootPackage = model.createPackage("RootPackage")
		rootPackage.createXtComponent("Component").createPackage("Package")
		dirtyComponent = rootPackage.createXtComponent("DirtyComponent")
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		dirtyComponent.createPackage("DirtyPackage")
	}
	
}

class XtComponentXtPackageUpdateMonitorTest extends XtumlMonitorBaseTest {
	private XTComponent dirtyComponent
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertEquals(dirtyComponent, components.head)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val rootPackage = model.createPackage("RootPackage")
		rootPackage.createXtComponent("Component").createPackage("Package")
		dirtyComponent = rootPackage.createXtComponent("DirtyComponent")
		dirtyComponent.createPackage("DirtyPackage")
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		dirtyComponent.packages.filter(Package).head.createXtClass("Class")
	}
	
}

class XtComponentXtPackageDeleteMonitorTest extends XtumlMonitorBaseTest {
	private XTComponent dirtyComponent
	
	override protected assertDirtyComponents(Set<XTComponent> components) {
		assertEquals(1, components.size)
		assertEquals(dirtyComponent, components.head)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val rootPackage = model.createPackage("RootPackage")
		rootPackage.createXtComponent("Component").createPackage("Package")
		dirtyComponent = rootPackage.createXtComponent("DirtyComponent")
		dirtyComponent.createPackage("DirtyPackage")
	}
	
	override protected modifyXtumlModel(Model xtModel) {
		EcoreUtil.remove(dirtyComponent.packages.filter(Package).head)
	}
	
}