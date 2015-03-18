package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.StateMachine
import com.incquerylabs.emdw.umlintegration.queries.Structure
import com.incquerylabs.emdw.umlintegration.queries.Trace
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

abstract class AbstractRule<Match extends IPatternMatch> {

	protected val Logger logger = Logger.getLogger(class)
	protected static extension val Trace tracePatterns = Trace.instance
	protected static extension val StateMachine stateMachinePatterns = StateMachine.instance
	protected static extension val Structure structurePatterns = Structure.instance
	protected val IncQueryEngine engine

	new(IncQueryEngine engine) {
		this.engine = engine
	}

	def getSpecification() {
		new PriorityRuleSpecification<Match> => [
			ruleSpecification = Rules.newMatcherRuleSpecification(querySpecification, Lifecycles.getDefault(true, true),
				#{appearedJob, updateJob, disappearedJob}
			)
			priority = rulePriority
		]
	}

	protected def IQuerySpecification<? extends IncQueryMatcher<Match>> getQuerySpecification()

	protected def int getRulePriority()

	private def getAppearedJob() {
		Jobs.newStatelessJob(IncQueryActivationStateEnum.APPEARED, [ Match match | appeared(match)])
	}
	
	protected def void appeared(Match match)
	
	private def getUpdateJob() {
		Jobs.newStatelessJob(IncQueryActivationStateEnum.UPDATED, [ Match match | updated(match)])
	}

	protected def void updated(Match match)

	private def getDisappearedJob() {
		Jobs.newStatelessJob(IncQueryActivationStateEnum.DISAPPEARED, [ Match match | disappeared(match) ])
	}
	
	protected def void disappeared(Match match)

	protected def getRootMapping() {
		val matcher = engine.rootMapping
		checkState(matcher.countMatches == 1, "Incorrect number of mappings!")
		matcher.oneArbitraryMatch.rootMapping
	}

}
