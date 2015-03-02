package com.incquerylabs.emdw.umlintegration.rules

import com.zeligsoft.xtumlrt.common.NamedElement
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine

abstract class AbstractContainmentRule<M extends IPatternMatch, P extends NamedElement, C extends NamedElement> extends AbstractRule<M> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override appeared(M match) {
		debug('''Mapping containment''')
		val parent = match.findParent
		val child = match.findChild
		parent.insertChild(child)
		debug('''Mapped containment''')
	}
	
	override protected updated(M m) {
	}
	
	override disappeared(M match) {
		debug('''Removing containment''')
		val child = match.findChild
		EcoreUtil.remove(child)
		debug('''Removed containment''')
	}

	protected def P findParent(M match)

	protected def C findChild(M match)
	
	protected def void insertChild(P parent, C child)

}
