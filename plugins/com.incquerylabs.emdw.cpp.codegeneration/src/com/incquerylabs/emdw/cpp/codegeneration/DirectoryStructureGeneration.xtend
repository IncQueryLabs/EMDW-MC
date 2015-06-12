package com.incquerylabs.emdw.cpp.codegeneration

import com.google.common.base.Stopwatch
import com.incquerylabs.emdw.cpp.codegeneration.directory.IDirectoryCreator
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppDirectoryStructureQueries
import com.incquerylabs.emdw.cpp.codegeneration.util.DirectoryRuleProvider
import java.util.concurrent.TimeUnit
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation

import static com.google.common.base.Preconditions.*

class DirectoryStructureGeneration {

	extension val Logger logger = Logger.getLogger(class)
	static val dirStructQueries = CppDirectoryStructureQueries.instance

	private var initialized = false;

	BatchTransformation transform
	IncQueryEngine engine
	DirectoryRuleProvider ruleProvider
	
	
	extension BatchTransformationStatements statements

	def initialize(IncQueryEngine engine, IDirectoryCreator directoryCreator) {
		checkArgument(engine != null, "Engine cannot be null!")
		
		if (!initialized) {
			this.engine = engine

			debug("Preparing queries on engine.")
			var watch = Stopwatch.createStarted
			val queries = GenericPatternGroup.of(dirStructQueries)
			queries.prepare(engine)
			info('''Prepared queries on engine («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
			
			debug("Preparing transformation rules.")
			transform = BatchTransformation.forEngine(engine)
			ruleProvider = new DirectoryRuleProvider(engine, directoryCreator)
			ruleProvider.addRules(transform)
			statements = new BatchTransformationStatements(transform)
			info('''Prepared transformation rules («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')

			initialized = true
		}
	}
	
	def execute() {
		val watch = Stopwatch.createStarted
		info('''Directory structure generation started''')
		fireAllCurrent(ruleProvider.cppRootDirectoryRule)
		fireAllCurrent(ruleProvider.cppSubDirectoryRule)
		info('''Directory structure generation finished («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
	}
	
	def dispose() {
		transform?.dispose
	}
}