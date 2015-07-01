package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.transformation.test.EventDrivenTransformationTest
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import org.eclipse.incquery.runtime.api.IncQueryEngine

@RunWith(Parameterized)
class CPPModelMappingTest extends EventDrivenTransformationTest<Model, CPPModel> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected checkCppObject(Model xtObject, IncQueryEngine engine) {}
	
	override protected createXtumlObject(Model modelRoot) {}
	
}