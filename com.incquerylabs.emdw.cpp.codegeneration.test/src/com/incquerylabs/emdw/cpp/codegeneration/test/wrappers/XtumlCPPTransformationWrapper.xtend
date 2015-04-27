package com.incquerylabs.emdw.cpp.codegeneration.test.wrappers

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.CPPCodeGeneration
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope

class CPPCodeGenerationWrapper extends TransformationWrapper {
	
	CPPCodeGeneration codegen
	AdvancedIncQueryEngine engine
	
	override initializeTransformation(CPPModel cppmodel) {
		engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(cppmodel.eResource.resourceSet))
		codegen = new CPPCodeGeneration
		codegen.initialize(cppmodel, engine)
	}
	
	override executeTransformation() {
		codegen.execute
	}
	
	override cleanupTransformation() {
		if (codegen != null) {
			codegen.dispose
		}
		if (engine != null) {
			engine.dispose
		}
	}
	
}