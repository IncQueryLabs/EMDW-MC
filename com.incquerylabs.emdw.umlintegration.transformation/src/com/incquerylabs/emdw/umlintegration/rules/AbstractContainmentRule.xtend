package com.incquerylabs.emdw.umlintegration.rules

import com.zeligsoft.xtumlrt.common.NamedElement
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine

/**
 * Establishes containment reference edges between already transformed objects.
 * Useful for recursive containment hierarchies.
 */
abstract class AbstractContainmentRule<Match extends IPatternMatch, Parent extends NamedElement, Child extends NamedElement> extends AbstractRule<Match> {

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

	protected def Parent findParent(Match match)

	protected def Child findChild(Match match)
	
	protected def void insertChild(Parent parent, Child child)

}