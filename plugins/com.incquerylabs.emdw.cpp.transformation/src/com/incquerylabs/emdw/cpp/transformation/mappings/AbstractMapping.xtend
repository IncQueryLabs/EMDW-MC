package com.incquerylabs.emdw.cpp.transformation.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import java.util.Map
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IQuerySpecification
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.api.IncQueryMatcher
import org.eclipse.papyrusrt.xtumlrt.common.Model

abstract class AbstractMapping<Match extends IPatternMatch> {
	
	protected extension Logger logger = Logger.getLogger(class)
	protected static extension val XtumlQueries xtumlPatterns = XtumlQueries.instance
	
	protected val IncQueryEngine engine
	
	protected val Map<Model, CPPModel> modelMapping = newHashMap()
	
	new(IncQueryEngine engine) {
		this.engine = engine
	}
	
	public def IQuerySpecification<? extends IncQueryMatcher<Match>> getQuerySpecification()
	
	protected def void appeared(Match match)

	protected def void updated(Match match)
	
	protected def void disappeared(Match match)
	
}