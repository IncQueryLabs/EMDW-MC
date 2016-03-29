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

import com.incquerylabs.emdw.umlintegration.queries.XtPortMatch
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPort
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Port

class XTPortRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new XTPortMapping(engine)
		}
	}
}

/**
 * Transforms ports which are a Component's owned attributes to the transformed XTComponent's ports.
 * Transformed fields: conjugate, lowerBound, upperBound.
 */
class XTPortMapping extends AbstractObjectMapping<XtPortMatch, Port, XTPort> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		XTPort
	}
	
	public static val PRIORITY = XTComponentMapping.PRIORITY + 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		xtPort
	}

	override getUmlObject(XtPortMatch match) {
		match.port
	}

	override createXtumlrtObject() {
		xtumlFactory.createXTPort
	}

	override updateXtumlrtObject(XTPort xtumlrtObject, XtPortMatch match) {
		xtumlrtObject.conjugate = match.umlObject.conjugated
		xtumlrtObject.lowerBound = match.umlObject.lowerBound
		xtumlrtObject.upperBound = match.umlObject.upperBound
	}

	def getXtumlrtContainer(XtPortMatch match) {
		match.component.findXtumlrtObject(XTComponent)
	}

	override insertXtumlrtObject(XTPort xtumlrtObject, XtPortMatch match) {
		match.xtumlrtContainer.ports += xtumlrtObject
	}
	
}
