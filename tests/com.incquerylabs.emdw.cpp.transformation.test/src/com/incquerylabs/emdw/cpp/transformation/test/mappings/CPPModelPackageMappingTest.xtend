package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.incquerylabs.emdw.cpp.transformation.test.EventDrivenTransformationTest
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CPPModelPackageMappingTest,
	CPPModelPackageInPackageMappingTest
])
@RunWith(Suite)
class CPPModelPackageMappingTestSuite {}

class CPPModelPackageMappingTest extends EventDrivenTransformationTest<Package, CPPPackage> {
	
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

class CPPModelPackageInPackageMappingTest extends EventDrivenTransformationTest<Package, CPPPackage> {
	
	override protected createXtumlObject(Model modelRoot) {
		val l1_package = createPackage(modelRoot, "test_package1")
		val l2_package = createPackage(l1_package, "test_package2")
		val l3_package = createPackage(l2_package, "test_package3")
		createPackage(l3_package, "test_package4")
	}
	
	override protected checkCppObjectCreated(Package xtObject, IncQueryEngine engine) {
		assertTrue("CPP package not created" , engine.cppPackages.allValuesOfxtPackage.contains(xtObject))
	}
	
	override protected checkCppObjectRemoved(Package xtObject, IncQueryEngine engine) {
		assertFalse("CPP package not removed" , engine.cppPackages.allValuesOfxtPackage.contains(xtObject))
	}
	
}