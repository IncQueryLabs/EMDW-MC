package com.incquerylabs.emdw.cpp.codegeneration.util

import com.incquerylabs.emdw.cpp.codegeneration.queries.CppDirectoryStructureQueries
import org.apache.log4j.Logger
import org.eclipse.core.resources.IProject
import org.eclipse.core.resources.IWorkspaceRoot
import org.eclipse.core.resources.ResourcesPlugin
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
	IWorkspaceRoot workspaceRoot = ResourcesPlugin.workspace.root
	IProject cppModelProject
	new(IncQueryEngine engine) {
		this.engine = engine;
	}
	
	public val cppModelRule = createRule.precondition(cppModel).action[match | 
		val cppModel = match.cppModel
		cppModelProject = workspaceRoot.getProject(cppModel.commonModel.name)
		
		dirCreator.createDir(cppModelProject)
		
		debug(
			'''
				CPPModelRule fired!
			'''
		)
		
	].build
	
	public val cppRootDirectoryRule = createRule.precondition(cppRootDirectory).action[match | 
		val cppDir = match.dir
		
		val folder = cppModelProject.getFolder(cppDir.name);
		
		dirCreator.createDir(folder) 
		
		debug(
			'''
				CPPRootDirectoryRule fired!
			'''
		)
		
	].build
	
	public val cppSubDirectoryRule = createRule.precondition(cppSubDirectory).action[match | 
		val cppDir = match.dir
		
		val folder = cppModelProject.getFolder(cppDir.path);
		
		dirCreator.createDir(folder) 
		
		debug(
			'''
				CPPSubDirectoryRule fired!
			'''
		)
		
	].build
	
	public def getCppModelProject() {
		cppModelProject
	}
	
	public def addRules(BatchTransformation transformation) {
		val rules = new BatchTransformationRuleGroup(
			cppModelRule,
			cppRootDirectoryRule,
			cppSubDirectoryRule
		)
		
		transformation.addRules(rules)
	}
}