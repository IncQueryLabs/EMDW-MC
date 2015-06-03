package com.incquerylabs.emdw.cpp.codegeneration.test.wrappers

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import com.incquerylabs.emdw.cpp.codegeneration.DirectoryStructureGeneration
import org.eclipse.core.resources.IProject

class DirectoryStructureWrapper extends TransformationWrapper {
	
	val IProject rootProject
	new(IProject rootProject) {
		this.rootProject = rootProject
	}
	
	AdvancedIncQueryEngine engine
	DirectoryStructureGeneration dirStructGen
	
	override initializeTransformation(CPPModel cppmodel) {
		engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(cppmodel.eResource.resourceSet))
		dirStructGen = new DirectoryStructureGeneration
		dirStructGen.initialize(cppmodel, rootProject, engine)
	}
	
	override executeTransformation() {
		dirStructGen.execute
	}
	
	override cleanupTransformation() {
		if (dirStructGen != null) {
			dirStructGen.dispose
		}
		if (engine != null) {
			engine.dispose
		}
	}
	
}