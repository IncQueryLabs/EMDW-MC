package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.StateMachine
import com.incquerylabs.emdw.umlintegration.queries.Structure
import com.incquerylabs.emdw.umlintegration.queries.Trace
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IQuerySpecification
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.api.IncQueryMatcher
import org.eclipse.uml2.uml.Element

import static com.google.common.base.Preconditions.*

/**
 * A transformation rule with a priority.
 * Handles appeared, updated and disappeared events of a query.
 */
abstract class AbstractMapping<Match extends IPatternMatch> {

	protected val Logger logger = Logger.getLogger(class)
	protected static extension val Trace tracePatterns = Trace.instance
	protected static extension val StateMachine stateMachinePatterns = StateMachine.instance
	protected static extension val Structure structurePatterns = Structure.instance
	protected val IncQueryEngine engine

	new(IncQueryEngine engine) {
		this.engine = engine
	}

	/**
	 * The pattern that matches the UML object to transform.
	 */
	public def IQuerySpecification<? extends IncQueryMatcher<Match>> getQuerySpecification()

	/**
	 * Higher priority rules will be executed later, so if a rule searches for an already transformed object in the trace, then its priority must be greater then that transformation's priority.
	 * For example, a containment mapping rule must have a higher priority than the mapping rule of the container objects. 
	 */
	def int getRulePriority()
	
	protected def void appeared(Match match)

	protected def void updated(Match match)
	
	protected def void disappeared(Match match)

	/**
	 * Returns the root of the transformation.
	 */
	protected def getRootMapping() {
		val matcher = engine.rootMapping
		checkState(matcher.countMatches == 1, "Incorrect number of mappings!")
		matcher.oneArbitraryMatch.rootMapping
	}

	/**
	 * Finds the xtumlrt object in the trace which was transformed from the given UML object.
	 */
	protected def <T> findXtumlrtObject(Element umlObject, Class<T> type) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, umlObject).filter(type).head		
	}

}
