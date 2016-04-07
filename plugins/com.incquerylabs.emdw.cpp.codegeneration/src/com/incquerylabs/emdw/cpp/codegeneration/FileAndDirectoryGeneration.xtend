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
package com.incquerylabs.emdw.cpp.codegeneration

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.google.common.base.Stopwatch
import com.google.common.collect.ImmutableMap
import com.incquerylabs.emdw.cpp.codegeneration.fsa.IFileManager
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppFileAndDirectoryQueries
import com.incquerylabs.emdw.cpp.codegeneration.util.FileAndDirectoryRuleProvider
import java.util.concurrent.TimeUnit
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation

import static com.google.common.base.Preconditions.*

class FileAndDirectoryGeneration {

	extension val Logger logger = Logger.getLogger(class)
	static val queries = CppFileAndDirectoryQueries.instance

	private var initialized = false;

	BatchTransformation transform
	IncQueryEngine engine
	FileAndDirectoryRuleProvider ruleProvider
	
	extension BatchTransformationStatements statements

	def initialize(IncQueryEngine engine, IFileManager fileManager, ImmutableMap<CPPSourceFile, CharSequence> contents) {
		checkArgument(engine != null, "Engine cannot be null!")
		
		if (!initialized) {
			this.engine = engine

			debug("Preparing queries on engine.")
			var watch = Stopwatch.createStarted
			val queries = GenericPatternGroup.of(queries)
			queries.prepare(engine)
			info('''Prepared queries on engine («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
			
			debug("Preparing file and directory generation rules.")
			transform = BatchTransformation.forEngine(engine)
			statements = new BatchTransformationStatements(transform)
			ruleProvider = new FileAndDirectoryRuleProvider(engine, statements, fileManager, contents)
			ruleProvider.addRules(transform)
			info('''Prepared file and directory generation rules («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')

			initialized = true
		} else {
			ruleProvider.updateSourceFileContents(contents)
		}
	}
	
	def execute() {
		val watch = Stopwatch.createStarted
		info('''File and directory generation started''')
		// Generate directory structure and files
		fireAllCurrent(ruleProvider.cppRootDirectoryRule)
		info('''File and directory generation finished («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
	}
	
	def execute(CPPDirectory cppDirectory) {
		val watch = Stopwatch.createStarted
		info('''File and directory generation started''')
		// Generate directory structure
		fireAllCurrent(ruleProvider.cppDirectoryRule, [it.cppDirectory == cppDirectory])
		info('''File and directory generation finished («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
	}
	
	def dispose() {
		transform?.dispose
	}
}