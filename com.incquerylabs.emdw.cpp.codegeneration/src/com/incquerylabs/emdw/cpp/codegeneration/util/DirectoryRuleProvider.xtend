package com.incquerylabs.emdw.cpp.codegeneration.util

import com.incquerylabs.emdw.cpp.codegeneration.directory.IDirectoryCreator
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppDirectoryStructureQueries
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation

class DirectoryRuleProvider {
	static extension val CppDirectoryStructureQueries = CppDirectoryStructureQueries.instance
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	
	IncQueryEngine engine
	IDirectoryCreator directoryCreator

	new(IncQueryEngine engine, IDirectoryCreator directoryCreator) {
		this.engine = engine;
		this.directoryCreator = directoryCreator
	}

	public val cppRootDirectoryRule = createRule.precondition(cppRootDirectory).action[match | 
		val cppDir = match.dir
		
		directoryCreator.createDirectory(cppDir.path) 
		
		DirectoryCreationUtil.synchronizeSubDirectories(cppDir, directoryCreator)
		
		debug(
			'''
				CPPRootDirectoryRule fired => «cppDir.name»
			'''
		)
		
	].build
	
	public val cppSubDirectoryRule = createRule.precondition(cppSubDirectory).action[match | 
		val cppDir = match.dir
		
		directoryCreator.createDirectory(cppDir.path) 
		
		DirectoryCreationUtil.synchronizeSubDirectories(cppDir, directoryCreator)
		
		debug(
			'''
				CPPSubDirectoryRule fired => «cppDir.path»
			'''
		)
		
	].build
	
	public def addRules(BatchTransformation transformation) {
		val rules = new BatchTransformationRuleGroup(
			cppRootDirectoryRule,
			cppSubDirectoryRule
		)
		
		transformation.addRules(rules)
	}
}