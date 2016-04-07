/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.codegeneration.util

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.google.common.collect.ImmutableMap
import com.incquerylabs.emdw.cpp.codegeneration.fsa.IFileManager
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppFileAndDirectoryQueries
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppSubDirectoryMatch
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppSubDirectoryMatcher
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRule
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation

class FileAndDirectoryRuleProvider {

	static extension val CppFileAndDirectoryQueries = CppFileAndDirectoryQueries.instance
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val BatchTransformationStatements statements
	
	IncQueryEngine engine
	IFileManager fileManager
	ImmutableMap<CPPSourceFile, CharSequence> sourceFileContents

	new(IncQueryEngine engine, BatchTransformationStatements statements, IFileManager fileManager, ImmutableMap<CPPSourceFile, CharSequence> contents) {
		this.engine = engine;
		this.statements = statements
		this.fileManager = fileManager
		this.sourceFileContents = contents
	}

	def public void updateSourceFileContents(ImmutableMap<CPPSourceFile, CharSequence> contents) {
		sourceFileContents = contents
	}

	public val cppDirectoryRule = createRule.precondition(cppDirectory).action[match | 
		val cppDirectory = match.cppDirectory
		
		fileManager.createDirectory(cppDirectory.path) 
		
		FileAndDirectoryGenerationUtil.synchronizeSubDirectories(cppDirectory, fileManager)
		
		FileAndDirectoryGenerationUtil.synchronizeDirectoryFiles(cppDirectory, fileManager)
		
		debug('''CPPRootDirectoryRule fired => «cppDirectory.name»''')
		generateSubElements(cppDirectory)
	].build
	
	public val cppRootDirectoryRule = createRule.precondition(cppRootDirectory).action[match | 
		val cppDirectory = match.cppDirectory
		
		fileManager.createDirectory(cppDirectory.path) 
		
		FileAndDirectoryGenerationUtil.synchronizeSubDirectories(cppDirectory, fileManager)
		
		FileAndDirectoryGenerationUtil.synchronizeDirectoryFiles(cppDirectory, fileManager)
		
		debug('''CPPRootDirectoryRule fired => «cppDirectory.name»''')
		generateSubElements(cppDirectory)
	].build
	
	public val BatchTransformationRule<CppSubDirectoryMatch, CppSubDirectoryMatcher> cppSubDirectoryRule = createRule.precondition(cppSubDirectory).action[match | 
		val cppDirectory = match.cppDirectory
		
		fileManager.createDirectory(cppDirectory.path) 
		
		FileAndDirectoryGenerationUtil.synchronizeSubDirectories(cppDirectory, fileManager)
		
		FileAndDirectoryGenerationUtil.synchronizeDirectoryFiles(cppDirectory, fileManager)
		
		debug('''CPPSubDirectoryRule fired => «cppDirectory.path»''')
		generateSubElements(cppDirectory)
	].build
	
	public val cppDirectoryFilesRule = createRule.precondition(cppDirectoryFiles).action[match |
		val cppDirectory = match.cppDirectory
		val cppSourceFile = match.cppSourceFile
		
		debug('''CPPDirectoryFilesRule fired => «cppDirectory.path»''')
		val fileContent = sourceFileContents.get(cppSourceFile)
		if (fileContent != null){
			fileManager.createFile(cppDirectory.path, cppSourceFile.generationName, fileContent, false, false)
		} else {
			debug('''The contents of the CPPSourceFile «cppSourceFile.generationName» was null.''');
		}
		
	].build
	
	private def generateSubElements(CPPDirectory cppDirectory){
		fireAllCurrent(cppDirectoryFilesRule, [it.cppDirectory == cppDirectory])
		fireAllCurrent(cppSubDirectoryRule, [it.parentDirectory == cppDirectory])
	}
	
	public def addRules(BatchTransformation transformation) {
		val rules = new BatchTransformationRuleGroup(
			cppDirectoryRule,
			cppSubDirectoryRule,
			cppDirectoryFilesRule
		)
		
		transformation.addRules(rules)
	}
}