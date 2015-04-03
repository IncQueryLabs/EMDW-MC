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

	/**
	 * Returns the source of the reference by getting the xtumlrt object from the trace associated to the appropriate match parameter.
	 */
	protected def XtumlrtObject findSource(Match match)

	/**
	 * Returns the target of the reference by getting the xtumlrt object from the trace associated to the appropriate match parameter.
	 */
	protected def XtumlrtObject findTarget(Match match)
	
	/**
	 * Inserts the target to the appropriate reference of the source.
	 */
	protected def void addTarget(XtumlrtObject source, XtumlrtObject target)
	
	/**
	 * Removes the target from the appropriate reference of the source.
	 */
	protected def void removeTarget(XtumlrtObject source, XtumlrtObject target)

}
