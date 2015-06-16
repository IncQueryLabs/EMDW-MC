package com.incquerylabs.emdw.cpp.codegeneration

import com.google.common.base.Stopwatch
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

	def initialize(IncQueryEngine engine, IFileManager fileManager) {
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
			ruleProvider = new FileAndDirectoryRuleProvider(engine, fileManager)
			ruleProvider.addRules(transform)
			statements = new BatchTransformationStatements(transform)
			info('''Prepared file and directory generation rules («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')

			initialized = true
		}
	}
	
	def execute() {
		val watch = Stopwatch.createStarted
		info('''File and directory generation started''')
		fireAllCurrent(ruleProvider.cppRootDirectoryRule)
		fireAllCurrent(ruleProvider.cppSubDirectoryRule)
		info('''File and directory generation finished («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
	}
	
	def dispose() {
		transform?.dispose
	}
}