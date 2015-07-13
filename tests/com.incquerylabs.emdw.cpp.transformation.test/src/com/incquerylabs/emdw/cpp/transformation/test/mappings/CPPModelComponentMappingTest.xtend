package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.incquerylabs.emdw.cpp.transformation.test.EventDrivenTransformationTest
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.XtumlCPPTransformationQrtWrapper
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*
import static org.junit.Assert.*

@RunWith(Parameterized)
class CPPModelComponentInPackageMappingTest extends EventDrivenTransformationTest<XTComponent, CPPComponent> {
	
	new(XtumlCPPTransformationQrtWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected checkCppObjectCreated(XTComponent xtObject, IncQueryEngine engine) {
		assertTrue("CPP component not created!" , engine.cppComponents.allValuesOfxtComponent.contains(xtObject))
	}
	
	override protected checkCppObjectRemoved(XTComponent xtObject, IncQueryEngine engine) {
		assertFalse("CPP component not removed!" , engine.cppComponents.allValuesOfxtComponent.contains(xtObject))
	}
	
	override protected createXtumlObject(Model modelRoot) {
		val package1 = createPackage(modelRoot, "package1")
		val package2 = createPackage(package1, "package2")
		createXtComponent(package2, "component1")
	}
	
}