package com.incquerylabs.emdw.cpp.codegeneration.util

import com.incquerylabs.emdw.cpp.codegeneration.queries.CppDirectoryStructureQueries
import org.apache.log4j.Logger
import org.eclipse.core.resources.IProject
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation

class DirectoryRuleProvider {
	static extension val CppDirectoryStructureQueries = CppDirectoryStructureQueries.instance
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	
	IncQueryEngine engine
	DirectoryCreator dirCreator = new DirectoryCreator

	IProject rootProject
	new(IncQueryEngine engine, IProject rootProject) {
		this.engine = engine;
		this.rootProject = rootProject;
		if(!this.rootProject.exists) {
			this.rootProject.create(null)
		}
		this.rootProject.open(null)
	}

	public val cppRootDirectoryRule = createRule.precondition(cppRootDirectory).action[match | 
		val cppDir = match.dir
		val folder = rootProject.getFolder(cppDir.name);
		
		dirCreator.createDir(folder) 
		
		dirCreator.synchronizeSubDirectories(cppDir, folder)
		
		debug(
			'''
				CPPRootDirectoryRule fired => «cppDir.name»
			'''
		)
		
	].build
	
	public val cppSubDirectoryRule = createRule.precondition(cppSubDirectory).action[match | 
		val cppDir = match.dir
		val folder = rootProject.getFolder(cppDir.path);
		
		dirCreator.createDir(folder)
		
		dirCreator.synchronizeSubDirectories(cppDir, folder)
		
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