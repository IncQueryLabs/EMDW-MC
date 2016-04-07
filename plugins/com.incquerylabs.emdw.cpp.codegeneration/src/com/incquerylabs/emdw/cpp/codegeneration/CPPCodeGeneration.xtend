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

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.google.common.base.Stopwatch
import com.google.common.collect.ImmutableMap
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import com.incquerylabs.emdw.cpp.codegeneration.util.RuleProvider
import java.util.concurrent.TimeUnit
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation

import static com.google.common.base.Preconditions.*

class CPPCodeGeneration {

	extension val Logger logger = Logger.getLogger(class)
	static val codeGenQueries = CppCodeGenerationQueries.instance
	private var initialized = false;

	BatchTransformation transform
	IncQueryEngine engine
	RuleProvider ruleProvider
	
	extension BatchTransformationStatements statements

	def initialize(IncQueryEngine engine) {
		checkArgument(engine != null, "Engine cannot be null!")
		if (!initialized) {
			this.engine = engine

			debug("Preparing queries on engine.")
			var watch = Stopwatch.createStarted
			val queries = GenericPatternGroup.of(codeGenQueries)
			queries.prepare(engine)
			info('''Prepared queries on engine («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
			
			debug("Preparing transformation rules.")
			transform = BatchTransformation.forEngine(engine)
			statements = new BatchTransformationStatements(transform)
			ruleProvider = new RuleProvider(engine, statements)
			ruleProvider.addRules(transform)
			info('''Prepared transformation rules («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')

			initialized = true
		}
	}

	def execute() {
			info('''Executing transformation on all components''')
			val watch = Stopwatch.createStarted
			fireAllCurrent(ruleProvider.cppComponentRule)
			info('''Initial execution of transformation rules finished («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
	}
	
	def execute(CPPComponent cppComponent) {
			checkArgument(cppComponent != null, "CPP Component cannot be null!")
			info('''Executing transformation on «cppComponent.cppName»''')
			val watch = Stopwatch.createStarted
			fireAllCurrent(ruleProvider.cppComponentRule, [it.cppComponent == cppComponent])
			info('''Initial execution of transformation rules finished («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
	}
	
	def getGeneratedCPPSourceFiles() {
		return ImmutableMap.copyOf(ruleProvider.generatedCPPSourceFiles)
	}

	def dispose() {
		transform?.dispose
	}
	
}