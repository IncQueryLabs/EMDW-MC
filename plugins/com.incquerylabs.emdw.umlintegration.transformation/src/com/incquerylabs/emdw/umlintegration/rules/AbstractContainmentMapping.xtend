/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Denes Harmath - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.umlintegration.rules

import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.NamedElement

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
		if(parent == null){
			logger.debug('''Containment edge for «child.name» without parent not added''')
			// save parentless objects to trace model to avoid exceptions on resource saving
			rootMapping.eResource.contents.add(child)
		} else {
			parent.insertChild(child, match)
			logger.debug('''Added containment edge «parent.name» -> «child.name»''')
		}
	}
	
	override updated(Match match) {
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
	 * Also passing the match to allow navigation in source model.
	 */
	protected def void insertChild(Parent parent, Child child, Match match)

}
