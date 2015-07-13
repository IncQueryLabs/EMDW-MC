package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.incquerylabs.emdw.cpp.transformation.test.EventDrivenTransformationTest
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.XtumlCPPTransformationQrtWrapper
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*
import static org.junit.Assert.*

@RunWith(Parameterized)
class CPPModelPackageMappingTest extends EventDrivenTransformationTest<Package, CPPPackage> {
	
	new(XtumlCPPTransformationQrtWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createXtumlObject(Model modelRoot) {
		createPackage(modelRoot, "test_package1")
	}
		
	override protected checkCppObjectCreated(Package xtObject, IncQueryEngine engine) {
		assertTrue("CPP package not exists" , engine.cppPackages.allValuesOfxtPackage.contains(xtObject))
	}
	
	override protected checkCppObjectRemoved(Package xtObject, IncQueryEngine engine) {
		assertFalse("CPP package not exists" , engine.cppPackages.allValuesOfxtPackage.contains(xtObject))
	}
	
}