package com.incquerylabs.emdw.umlintegration

import com.google.common.base.Stopwatch
import com.incquerylabs.emdw.umlintegration.queries.StateMachine
import com.incquerylabs.emdw.umlintegration.queries.Structure
import com.incquerylabs.emdw.umlintegration.queries.Trace
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.incquerylabs.emdw.umlintegration.util.PerJobFixedPriorityConflictResolver
import java.util.concurrent.TimeUnit
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.transformation.eventdriven.EventDrivenTransformation

import static com.google.common.base.Preconditions.*
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import com.incquerylabs.emdw.umlintegration.util.RuleProvider

class TransformationQrt {

	extension val Logger logger = Logger.getLogger(class)
	extension RuleProvider ruleProvider
	static val tracePatterns = Trace.instance
	static val stateMachinePatterns = StateMachine.instance
	static val structurePatterns = Structure.instance
	private var initialized = false;

	EventDrivenTransformation transform
	RootMapping mapping
	IncQueryEngine engine

	def initialize(RootMapping mapping, IncQueryEngine engine) {
		checkArgument(mapping != null, "Mapping cannot be null!")
		checkArgument(mapping.umlRoot != null, "Source not defined in mapping!")
		checkArgument(mapping.xtumlrtRoot != null, "Target not defined in mapping!")
		checkArgument(engine != null, "Engine cannot be null!")
		if (!initialized) {
			this.mapping = mapping
			this.engine = engine

			debug("Preparing queries on engine.")
			var watch = Stopwatch.createStarted
			GenericPatternGroup.of(tracePatterns, stateMachinePatterns, structurePatterns)
			info('''Prepared queries on engine («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
			
			debug("Preparing transformation rules.")
			ruleProvider = new RuleProvider(engine)
			initRules
			val fixedPriorityResolver = new PerJobFixedPriorityConflictResolver
			fixedPriorityResolver.setPriorities
			transform = EventDrivenTransformation.forSource(mapping.eResource.resourceSet).
			setConflictResolver(fixedPriorityResolver)
			transform.addRules
			transform.create
			info('''Prepared transformation rules («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')

			initialized = true
		}
	}

	def execute() {
			info('''Executing transformation on «mapping.umlRoot.name»''')
			val watch = Stopwatch.createStarted
			debug("Initial execution of transformation rules.")
			watch.reset.start
			transform.executionSchema.startUnscheduledExecution
			info('''Initial execution of transformation rules finished («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
	}

	def dispose() {
		transform?.executionSchema?.dispose
	}

}
