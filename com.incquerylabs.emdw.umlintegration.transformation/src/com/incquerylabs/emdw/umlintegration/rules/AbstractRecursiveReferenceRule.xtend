package com.incquerylabs.emdw.umlintegration.rules

import com.zeligsoft.xtumlrt.common.NamedElement
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine

/**
 * Establishes reference edges between already transformed objects of the same type.
 * Useful for recursive cross-references.
 */
abstract class AbstractRecursiveReferenceRule<Match extends IPatternMatch, XtumlrtObject extends NamedElement> extends AbstractRule<Match> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override appeared(Match match) {
		val source = match.findSource
		val target = match.findTarget
		source.addTarget(target)
		logger.debug('''Added edge «source» -> «target»''')
	}
	
	override protected updated(Match match) {
	}
	
	override disappeared(Match match) {
		val source = match.findSource
		val target = match.findTarget
		source.removeTarget(target)
		logger.debug('''Removed edge «source» -> «target»''')
	}

	protected def XtumlrtObject findSource(Match match)

	protected def XtumlrtObject findTarget(Match match)
	
	protected def void addTarget(XtumlrtObject source, XtumlrtObject target)
	
	protected def void removeTarget(XtumlrtObject source, XtumlrtObject target)

}
