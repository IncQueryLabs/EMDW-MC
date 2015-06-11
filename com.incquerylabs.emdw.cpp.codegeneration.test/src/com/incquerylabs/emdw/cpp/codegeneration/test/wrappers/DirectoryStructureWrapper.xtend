package com.incquerylabs.emdw.cpp.codegeneration.test.wrappers

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.DirectoryStructureGeneration
import com.incquerylabs.emdw.cpp.codegeneration.directory.IDirectoryCreator
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope

class DirectoryStructureWrapper extends TransformationWrapper {
	
	AdvancedIncQueryEngine engine
	DirectoryStructureGeneration directoryStructureGeneration
	
	override initializeTransformation(CPPModel cppModel) {
		engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(cppModel.eResource.resourceSet))
		directoryStructureGeneration = new DirectoryStructureGeneration
		//dirStructGen.initialize(cppDirectory, directoryCreator, engine)
	}
	
	def initializeDirectoryStructureGenerator(IDirectoryCreator directoryCreator) {
		directoryStructureGeneration.initialize(engine, directoryCreator)
	}
	
	override executeTransformation() {
		directoryStructureGeneration.execute
	}
	
	override cleanupTransformation() {
		if (directoryStructureGeneration != null) {
			directoryStructureGeneration.dispose
		}
		if (engine != null) {
			engine.dispose
		}
	}
	
}