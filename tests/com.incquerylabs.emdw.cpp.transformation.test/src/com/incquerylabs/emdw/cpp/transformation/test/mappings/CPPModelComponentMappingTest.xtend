package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.incquerylabs.emdw.cpp.transformation.test.EventDrivenTransformationTest
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CPPModelComponentMappingTest,
	CPPModelComponentInPackageMappingTest
])
@RunWith(Suite)
class CPPModelComponentMappingTestSuite {}

class CPPModelComponentMappingTest extends EventDrivenTransformationTest<XTComponent, CPPComponent> {
	
	override protected checkCppObjectCreated(XTComponent xtObject, IncQueryEngine engine) {
		assertTrue("CPP component not created!" , engine.cppComponents.allValuesOfxtComponent.contains(xtObject))
	}
	
	override protected checkCppObjectRemoved(CPPModel cppModel, XTComponent xtObject) {
		val cppComponents = cppModel.subElements.filter(CPPComponent)
		assertFalse("CPP component not removed!" , cppComponents.exists[xtComponent.equals(xtObject)])
	}
	
	override protected createXtumlObject(Model modelRoot) {
		createXtComponent(modelRoot, "component1")
	}
	
}

class CPPModelComponentInPackageMappingTest extends EventDrivenTransformationTest<XTComponent, CPPComponent> {
	
	override protected checkCppObjectCreated(XTComponent xtObject, IncQueryEngine engine) {
		assertTrue("CPP component not created!" , engine.cppComponents.allValuesOfxtComponent.contains(xtObject))
	}
	
	override protected checkCppObjectRemoved(CPPModel cppModel, XTComponent xtObject) {
		val cppPackage1 = cppModel.subElements.filter(CPPPackage).head
		val cppPackage2 = cppPackage1.subElements.filter(CPPPackage).head
		val cppComponents = cppPackage2.subElements.filter(CPPComponent)
		assertFalse("CPP component not removed!" , cppComponents.exists[xtComponent.equals(xtObject)])
	}
	
	override protected createXtumlObject(Model modelRoot) {
		val package1 = createPackage(modelRoot, "package1")
		val package2 = createPackage(package1, "package2")
		createXtComponent(package2, "component1")
	}
	
}