package com.incquerylabs.emdw.cpp.codegeneration.util

import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.google.common.collect.ImmutableMap
import com.incquerylabs.emdw.cpp.codegeneration.fsa.IFileManager
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppFileAndDirectoryQueries
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation

class FileAndDirectoryRuleProvider {

	static extension val CppFileAndDirectoryQueries = CppFileAndDirectoryQueries.instance
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	
	IncQueryEngine engine
	IFileManager fileManager
	ImmutableMap<CPPSourceFile, CharSequence> sourceFileContents

	new(IncQueryEngine engine, IFileManager fileManager, ImmutableMap<CPPSourceFile, CharSequence> contents) {
		this.engine = engine;
		this.fileManager = fileManager
		this.sourceFileContents = contents
	}

	public val cppRootDirectoryRule = createRule.precondition(cppRootDirectory).action[match | 
		val cppDir = match.dir
		
		fileManager.createDirectory(cppDir.path) 
		
		FileAndDirectoryGenerationUtil.synchronizeSubDirectories(cppDir, fileManager)
		
		FileAndDirectoryGenerationUtil.synchronizeDirectoryFiles(cppDir, fileManager)
		
		debug('''CPPRootDirectoryRule fired => «cppDir.name»''')
		
	].build
	
	public val cppSubDirectoryRule = createRule.precondition(cppSubDirectory).action[match | 
		val cppDir = match.dir
		
		fileManager.createDirectory(cppDir.path) 
		
		FileAndDirectoryGenerationUtil.synchronizeSubDirectories(cppDir, fileManager)
		
		FileAndDirectoryGenerationUtil.synchronizeDirectoryFiles(cppDir, fileManager)
		
		debug('''CPPSubDirectoryRule fired => «cppDir.path»''')
		
	].build
	
	public val cppDirectoryFilesRule = createRule.precondition(cppDirectoryFiles).action[match |
		val cppDirectory = match.cppDir
		val cppSourceFile = match.cppSourceFile
		
		fileManager.createFile(cppDirectory.path, cppSourceFile.generationName, sourceFileContents.get(cppSourceFile), false, true)
		
	].build
	
	public def addRules(BatchTransformation transformation) {
		val rules = new BatchTransformationRuleGroup(
			cppRootDirectoryRule,
			cppSubDirectoryRule,
			cppDirectoryFilesRule
		)
		
		transformation.addRules(rules)
	}
}