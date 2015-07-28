package com.incquerylabs.emdw.cpp.transformation.test.monitor

import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import java.util.Set
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

@RunWith(Parameterized)
class XtComponentXtClassCreateMonitorTest extends XtumlMonitorBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
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

@RunWith(Parameterized)
class XtComponentXtClassUpdateMonitorTest extends XtumlMonitorBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
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

@RunWith(Parameterized)
class XtComponentXtClassDeleteMonitorTest extends XtumlMonitorBaseTest {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
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