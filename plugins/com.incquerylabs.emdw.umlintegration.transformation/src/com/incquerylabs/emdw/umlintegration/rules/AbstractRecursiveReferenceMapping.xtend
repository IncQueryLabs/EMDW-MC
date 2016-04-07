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

import org.eclipse.papyrusrt.xtumlrt.common.NamedElement
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine

/**
 * Establishes reference edges between already transformed objects of the same type.
 * Useful for recursive cross-references.
 */
abstract class AbstractRecursiveReferenceMapping<Match extends IPatternMatch, XtumlrtObject extends NamedElement> extends AbstractMapping<Match> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override appeared(Match match) {
		val source = match.findSource
		val target = match.findTarget
		source.addTarget(target)
		logger.debug('''Added edge «source.name» -> «target.name»''')
	}
	
	override updated(Match match) {
	}
	
	override disappeared(Match match) {
		val source = match.findSource
		val target = match.findTarget
		source.removeTarget(target)
		logger.debug('''Removed edge «source.name» -> «target.name»''')
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
