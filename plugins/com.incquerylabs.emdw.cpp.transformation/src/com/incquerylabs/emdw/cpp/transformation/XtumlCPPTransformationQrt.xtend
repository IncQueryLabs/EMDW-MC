package com.incquerylabs.emdw.cpp.transformation

import com.google.common.base.Stopwatch
import com.incquerylabs.emdw.cpp.transformation.util.RuleProvider
import java.util.concurrent.TimeUnit
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.evm.api.Scheduler.ISchedulerFactory
import org.eclipse.incquery.runtime.evm.specific.Schedulers
import org.eclipse.viatra.emf.runtime.transformation.eventdriven.EventDrivenTransformation
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.incquery.runtime.evm.api.Executor
import org.eclipse.viatra.emf.runtime.transformation.eventdriven.ExecutionSchemaBuilder

class XtumlCPPTransformationQrt {
	
	extension val Logger logger = Logger.getLogger(class)
	extension RuleProvider ruleProvider
	
	static val xtumlPatterns = XtumlQueries.instance
	
	EventDrivenTransformation transform
	private var ISchedulerFactory schedulerFactory
	
	private var initialized = false;
	@Accessors Executor executor
	def initialize(IncQueryEngine engine) {
		if(!initialized) {
			if(schedulerFactory == null) {
				schedulerFactory = Schedulers.getIQEngineSchedulerFactory(engine)
			}
		}
		
		debug("Preparing queries on engine.")
		var watch = Stopwatch.createStarted
		
		val queries = GenericPatternGroup.of(xtumlPatterns)
		queries.prepare(engine)
		
		val transformationBuilder = EventDrivenTransformation.forEngine(engine)
		
		if(executor !=null){
			val schema = new ExecutionSchemaBuilder()
				.setEngine(engine)
				.setExecutor(executor).build
			transformationBuilder.schema = schema
		}
		
		ruleProvider = new RuleProvider(engine)
		initRules
		
		transformationBuilder.addRules
		
		transform = transformationBuilder.build
		
		info('''Prepared transformation rules («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')

		initialized = true
	}
	
	def execute() {
		info('''Executing transformation''')
		debug("Initial execution of transformation rules.")
		val watch = Stopwatch.createStarted
		transform.executionSchema.startUnscheduledExecution
		info('''Initial execution of transformation rules finished («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
	}
	
	def dispose() {
		transform?.executionSchema?.dispose
	}
	
}