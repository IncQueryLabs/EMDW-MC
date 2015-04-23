package com.incquerylabs.emdw.umlintegration.rules

import org.eclipse.papyrusrt.xtumlrt.common.NamedElement
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine

/**
 * Establishes containment reference edges between already transformed objects.
 * Useful for recursive containment hierarchies.
 */
abstract class AbstractContainmentMapping<Match extends IPatternMatch, Parent extends NamedElement, Child extends NamedElement> extends AbstractMapping<Match> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override appeared(Match match) {
		val parent = match.findParent
		val child = match.findChild
		parent.insertChild(child)
		logger.debug('''Added containment edge «parent» -> «child»''')
	}
	
	override protected updated(Match match) {
	}
	
	override disappeared(Match match) {
		// AbstractObjectRule already removes the child from the containment hierarchy
	}

	/**
	 * Returns the containment parent by getting the xtumlrt object from the trace associated to the appropriate match parameter.
	 */
	protected def Parent findParent(Match match)

	/**
	 * Returns the containment child by getting the xtumlrt object from the trace associated to the appropriate match parameter.
	 */
	protected def Child findChild(Match match)
	
	/**
	 * Inserts the child to the appropriate containment reference of the parent.
	 */
	protected def void insertChild(Parent parent, Child child)

}
