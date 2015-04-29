package com.incquerylabs.emdw.umlintegration

import com.google.common.base.Stopwatch
import com.incquerylabs.emdw.umlintegration.queries.StateMachine
import com.incquerylabs.emdw.umlintegration.queries.Structure
import com.incquerylabs.emdw.umlintegration.queries.Trace
import com.incquerylabs.emdw.umlintegration.util.PerJobFixedPriorityConflictResolver
import com.incquerylabs.emdw.umlintegration.util.RuleProvider
import java.util.concurrent.TimeUnit
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.transformation.eventdriven.EventDrivenTransformation

import static com.google.common.base.Preconditions.*

class TransformationQrt {

	extension val Logger logger = Logger.getLogger(class)
	extension RuleProvider ruleProvider
	static val tracePatterns = Trace.instance
	static val stateMachinePatterns = StateMachine.instance
	static val structurePatterns = Structure.instance
	private var initialized = false;

	EventDrivenTransformation transform
	IncQueryEngine engine

	def initialize(IncQueryEngine engine) {
		checkArgument(engine != null, "Engine cannot be null!")
		if (!initialized) {
			this.engine = engine

			debug("Preparing queries on engine.")
			var watch = Stopwatch.createStarted
			val queries = GenericPatternGroup.of(tracePatterns, stateMachinePatterns, structurePatterns)
			queries.prepare(engine)
			info('''Prepared queries on engine («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
			
			debug("Preparing transformation rules.")
			transform = EventDrivenTransformation.forEngine(engine)
			ruleProvider = new RuleProvider(engine)
			initRules
			val fixedPriorityResolver = new PerJobFixedPriorityConflictResolver
			fixedPriorityResolver.setPriorities
			transform.setConflictResolver(fixedPriorityResolver)
			transform.addRules
			transform.create
			info('''Prepared transformation rules («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')

			initialized = true
		}
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
