package com.incquerylabs.emdw.cpp.codegeneration.test.wrappers

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.FileAndDirectoryGeneration
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import com.incquerylabs.emdw.cpp.codegeneration.fsa.IFileManager

class FileAndDirectoryGenerationWrapper extends TransformationWrapper {
	
	AdvancedIncQueryEngine engine
	FileAndDirectoryGeneration fileAndDirGeneration
	
	override initializeTransformation(CPPModel cppModel) {
		engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(cppModel.eResource.resourceSet))
		fileAndDirGeneration = new FileAndDirectoryGeneration
	}
	
	def initializeFileAndDirectoryGenerator(IFileManager fileManager) {
		fileAndDirGeneration.initialize(engine, fileManager)
	}
	
	override executeTransformation() {
		fileAndDirGeneration.execute
	}
	
	override cleanupTransformation() {
		if (fileAndDirGeneration != null) {
			fileAndDirGeneration.dispose
		}
		if (engine != null) {
			engine.dispose
		}
	}
	
}