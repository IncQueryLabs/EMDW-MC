package com.incquerylabs.emdw.cpp.transformation

import com.google.common.base.Stopwatch
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.cpp.transformation.util.RuleProvider
import java.util.concurrent.TimeUnit
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation

import static com.google.common.base.Preconditions.*

class XtumlComponentCPPTransformation {

	extension val Logger logger = Logger.getLogger(class)
	static val xtUmlQueries = XtumlQueries.instance
	private var initialized = false;

	Model xtUmlModel
	IncQueryEngine engine
	BatchTransformation transform
	RuleProvider ruleProvider
	extension BatchTransformationStatements statements
	

	def initialize(Model xtUmlModel, IncQueryEngine engine) {
		checkArgument(xtUmlModel != null, "XTUML Model cannot be null!")
		checkArgument(engine != null, "Engine cannot be null!")
		if (!initialized) {
			this.xtUmlModel = xtUmlModel
			this.engine = engine

			debug("Preparing queries on engine.")
			var watch = Stopwatch.createStarted
			val queries = GenericPatternGroup.of(xtUmlQueries)
			queries.prepare(engine)
			info('''Prepared queries on engine («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
			
			debug("Preparing transformation rules.")
			transform = BatchTransformation.forEngine(engine)
			ruleProvider = new RuleProvider(engine)
			ruleProvider.addRules(transform)
			statements = new BatchTransformationStatements(transform)
			info('''Prepared transformation rules («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')

			initialized = true
		}
	}

	def execute() {
			info('''Executing transformation on «xtUmlModel.name»''')
			val watch = Stopwatch.createStarted
			statements.fireAllCurrent(ruleProvider.cleanComponentsRule)
			statements.fireAllCurrent(ruleProvider.componentAttributeRule)
			statements.fireAllCurrent(ruleProvider.componentOperationRule)
			statements.fireAllCurrent(ruleProvider.classRule)
			statements.fireAllCurrent(ruleProvider.classAttributeRule)
			statements.fireAllCurrent(ruleProvider.classOperationRule)
			statements.fireAllCurrent(ruleProvider.stateRule)
			statements.fireAllCurrent(ruleProvider.transitionRule)
			statements.fireAllCurrent(ruleProvider.eventRule)
			info('''Initial execution of transformation rules finished («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
	}

	def dispose() {
		transform?.dispose
	}
	
}