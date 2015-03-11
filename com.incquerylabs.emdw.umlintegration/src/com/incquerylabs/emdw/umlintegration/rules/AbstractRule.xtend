package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.util.PriorityRuleSpecification
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IQuerySpecification
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.api.IncQueryMatcher
import org.eclipse.incquery.runtime.evm.specific.Jobs
import org.eclipse.incquery.runtime.evm.specific.Lifecycles
import org.eclipse.incquery.runtime.evm.specific.Rules
import org.eclipse.incquery.runtime.evm.specific.event.IncQueryActivationStateEnum

import static com.google.common.base.Preconditions.*
import com.incquerylabs.emdw.umlintegration.queries.Trace
import com.incquerylabs.emdw.umlintegration.queries.StateMachine
import com.incquerylabs.emdw.umlintegration.queries.Structure

abstract class AbstractRule<M extends IPatternMatch> {

	protected extension Logger logger = Logger.getLogger(class)
	protected static extension Trace tracePatterns = Trace.instance
	protected static extension StateMachine stateMachinePatterns = StateMachine.instance
	protected static extension Structure structurePatterns = Structure.instance
	protected IncQueryEngine engine

	new(IncQueryEngine engine) {
		this.engine = engine
	}

	def getSpecification() {
		new PriorityRuleSpecification<M> => [
			ruleSpecification = Rules.newMatcherRuleSpecification(querySpecification, Lifecycles.getDefault(true, true),
				#{appearedJob, updateJob, disappearedJob})
			priority = rulePriority
		]
	}

	protected def getRootMapping() {
		val matcher = engine.rootMapping
		checkState(matcher.countMatches == 1, "Incorrect number of mappings!")
		matcher.oneArbitraryMatch.rootMapping
	}

	private def getAppearedJob() {
		Jobs.newStatelessJob(IncQueryActivationStateEnum.APPEARED,
			[ M match | appeared(match)])
	}
	
	protected def void appeared(M m)
	
	private def getUpdateJob() {
		Jobs.newStatelessJob(IncQueryActivationStateEnum.UPDATED,
			[ M match | updated(match)])
	}

	protected def void updated(M m)

	private def getDisappearedJob() {
		Jobs.newStatelessJob(IncQueryActivationStateEnum.DISAPPEARED,
			[ M match | disappeared(match) ])
	}
	
	protected def void disappeared(M m)

	protected def IQuerySpecification<? extends IncQueryMatcher<M>> getQuerySpecification()

	protected def int getRulePriority()

}
