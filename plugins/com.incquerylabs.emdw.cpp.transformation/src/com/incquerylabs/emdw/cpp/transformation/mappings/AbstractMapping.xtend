package com.incquerylabs.emdw.cpp.transformation.mappings

import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IQuerySpecification
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.api.IncQueryMatcher

abstract class AbstractMapping<Match extends IPatternMatch> {
	
	protected extension Logger logger = Logger.getLogger(class)
	protected static extension val XtumlQueries xtumlPatterns = XtumlQueries.instance
	
	protected val IncQueryEngine engine
	
	new(IncQueryEngine engine) {
		this.engine = engine
	}
	
	public def IQuerySpecification<? extends IncQueryMatcher<Match>> getQuerySpecification()
	
	protected def void appeared(Match match)

	protected def void updated(Match match)
	
	protected def void disappeared(Match match)
	
}