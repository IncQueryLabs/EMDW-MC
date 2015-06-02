package com.incquerylabs.emdw.cpp.codegeneration

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.google.common.base.Stopwatch
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
	CPPModel cppModel

	extension BatchTransformationStatements statements

	def initialize(CPPModel cppModel, IncQueryEngine engine) {
		checkArgument(cppModel != null, "CPP Model cannot be null!")
		checkArgument(engine != null, "Engine cannot be null!")
		
		if (!initialized) {
			this.cppModel = cppModel
			this.engine = engine

			debug("Preparing queries on engine.")
			var watch = Stopwatch.createStarted
			val queries = GenericPatternGroup.of(dirStructQueries)
			queries.prepare(engine)
			info('''Prepared queries on engine («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
			
			debug("Preparing transformation rules.")
			transform = BatchTransformation.forEngine(engine)
			ruleProvider = new DirectoryRuleProvider(engine)
			ruleProvider.addRules(transform)
			statements = new BatchTransformationStatements(transform)
			info('''Prepared transformation rules («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')

			initialized = true
		}
	}
	
	def execute() {
		info('''Executing transformation on «cppModel.commonModel.name»''')
		val watch = Stopwatch.createStarted
		fireAllCurrent(ruleProvider.cppModelRule)
		fireAllCurrent(ruleProvider.cppRootDirectoryRule)
		fireAllCurrent(ruleProvider.cppSubDirectoryRule)
		info('''Initial execution of transformation rules finished («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
	}
	
	def dispose() {
		transform?.dispose
	}
}