package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.transformation.test.EventDrivenTransformationTest
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CPPModelMappingTest
])
@RunWith(Suite)
class CPPModelMappingTestSuite {}

class CPPModelMappingTest extends EventDrivenTransformationTest<Model, CPPModel> {
	
	override protected createXtumlObject(Model modelRoot) {
		modelRoot
	}
	
	override protected checkCppObjectCreated(Model xtObject, IncQueryEngine engine) {
		val cppModelMatch = engine.cppModel.allMatches.head
		assertNotNull(cppModelMatch)
		assertEquals(xtObject, cppModelMatch.cppModel.commonModel)
	}
	
	override protected checkCppObjectRemoved(Model xtObject, IncQueryEngine engine) {
		
	}
	
}