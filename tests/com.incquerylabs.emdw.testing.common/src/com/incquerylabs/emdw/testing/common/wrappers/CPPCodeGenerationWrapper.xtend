package com.incquerylabs.emdw.testing.common.wrappers

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.CPPCodeGeneration
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent

class CPPCodeGenerationWrapper extends TransformationWrapper {
	
	CPPCodeGeneration codegen
	AdvancedIncQueryEngine engine
	
	override initializeTransformation(CPPModel cppmodel) {
		engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(cppmodel.eResource.resourceSet))
		codegen = new CPPCodeGeneration
		codegen.initialize(engine)
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
	
	def getCodegen() {
		return this.codegen
	}
	
	override executeTransformation(XTComponent xtComponent) {
		throw new UnsupportedOperationException("Unsupported operation")
	}
	
	override initializeTransformation(RootMapping umlToCommon) {
		throw new UnsupportedOperationException("Unsupported operation")
	}
	
}