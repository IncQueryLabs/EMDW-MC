package com.incquerylabs.emdw.testing.common.utils

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.google.common.collect.ImmutableMap
import com.incquerylabs.emdw.cpp.codegeneration.CPPCodeGeneration
import com.incquerylabs.emdw.cpp.codegeneration.FileAndDirectoryGeneration
import com.incquerylabs.emdw.cpp.codegeneration.MakefileGeneration
import com.incquerylabs.emdw.cpp.codegeneration.fsa.IFileManager
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope

class FileAndDirectoryGenerationUtil {

	AdvancedIncQueryEngine engine
	FileAndDirectoryGeneration fileAndDirGeneration
	CPPCodeGeneration cppCodeGeneration
	MakefileGeneration makefileGeneration
	CPPDirectory rootBodyDir
	CPPDirectory rootHeaderDir
	IFileManager fileManager

	def initializeGeneration(CPPModel cppModel, IFileManager fileManager) {
		engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(cppModel.eResource.resourceSet))
		fileAndDirGeneration = new FileAndDirectoryGeneration
		cppCodeGeneration = new CPPCodeGeneration
		cppCodeGeneration.initialize(engine)
		makefileGeneration = new MakefileGeneration
		makefileGeneration.initialize
		this.rootBodyDir = cppModel.bodyDir
		this.rootHeaderDir = cppModel.headerDir
		this.fileManager = fileManager
	}

	def executeCodeGeneration() {
		cppCodeGeneration.execute
	}

	def executeMakeGeneration() {
		makefileGeneration.executeRulesMk(rootBodyDir)
		if (rootBodyDir != rootHeaderDir) {
			makefileGeneration.executeRulesMk(rootHeaderDir)
		}
	}

	def executeFileGeneration() {
		fileAndDirGeneration.initialize(engine, fileManager, generatedCPPSourceFileContents)
		fileAndDirGeneration.execute
	}

	def executeAllGeneration() {
		cppCodeGeneration.execute
		makefileGeneration.executeRulesMk(rootBodyDir)
		if (rootBodyDir != rootHeaderDir) {
			makefileGeneration.executeRulesMk(rootHeaderDir)
		}
		fileAndDirGeneration.initialize(engine, fileManager, generatedCPPSourceFileContents)
		fileAndDirGeneration.execute
	}

	def ImmutableMap<CPPSourceFile, CharSequence> getGeneratedCPPSourceFileContents() {
		var sourcefiles = <CPPSourceFile, CharSequence>newHashMap
		sourcefiles.putAll(cppCodeGeneration.generatedCPPSourceFiles)
		sourcefiles.putAll(makefileGeneration.generatedCPPMakeFiles)
		ImmutableMap.copyOf(sourcefiles)
	}

	def cleanupGeneration() {
		if (fileAndDirGeneration != null) {
			fileAndDirGeneration.dispose
		}
		if (cppCodeGeneration != null) {
			cppCodeGeneration.dispose
		}
		if (engine != null) {
			engine.dispose
		}
	}
}