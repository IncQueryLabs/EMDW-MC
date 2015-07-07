package com.incquerylabs.emdw.cpp.codegeneration.test.wrappers

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.google.common.collect.ImmutableMap
import com.incquerylabs.emdw.cpp.codegeneration.CPPCodeGeneration
import com.incquerylabs.emdw.cpp.codegeneration.FileAndDirectoryGeneration
import com.incquerylabs.emdw.cpp.codegeneration.fsa.IFileManager
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope

class FileAndDirectoryGenerationWrapper extends TransformationWrapper {
	
	AdvancedIncQueryEngine engine
	FileAndDirectoryGeneration fileAndDirGeneration
	CPPCodeGeneration cppCodeGeneration
	
	override initializeTransformation(CPPModel cppModel) {
		engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(cppModel.eResource.resourceSet))
		fileAndDirGeneration = new FileAndDirectoryGeneration
		cppCodeGeneration = new CPPCodeGeneration
		cppCodeGeneration.initialize(engine)
	}
	
	def initializeFileAndDirectoryGenerator(IFileManager fileManager, ImmutableMap<CPPSourceFile, CharSequence> contents) {
		fileAndDirGeneration.initialize(engine, fileManager, contents)
	}
	
	override executeTransformation() {
		cppCodeGeneration.execute
	}
	
	def executeFileAndDirectoryGeneration() {
		fileAndDirGeneration.execute
	}
	
	def ImmutableMap<CPPSourceFile, CharSequence> getGeneratedCPPSourceFileContents() {
		val sourcefiles = cppCodeGeneration.generatedCPPSourceFiles
		sourcefiles
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