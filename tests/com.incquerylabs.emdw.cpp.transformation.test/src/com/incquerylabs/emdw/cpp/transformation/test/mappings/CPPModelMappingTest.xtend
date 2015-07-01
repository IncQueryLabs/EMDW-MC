package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.transformation.test.EventDrivenTransformationTest
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

@RunWith(Parameterized)
class CPPModelMappingTest extends EventDrivenTransformationTest<Model, CPPModel> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createXtumlObject(Model modelRoot) {}
	
	override protected checkCppObjectCreated(Model xtObject, IncQueryEngine engine) {
		val cppModelMatch = engine.cppModel.allMatches.head
		assertNotNull(cppModelMatch)
		assertEquals(xtObject, cppModelMatch.cppModel.commonModel)
	}
	
	override protected checkCppObjectRemoved(Model xtObject, IncQueryEngine engine) {
		
	}
	
}