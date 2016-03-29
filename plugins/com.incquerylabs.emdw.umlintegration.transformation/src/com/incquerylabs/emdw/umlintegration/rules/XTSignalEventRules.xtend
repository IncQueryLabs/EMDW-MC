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

import com.incquerylabs.emdw.umlintegration.queries.XtSignalEventMatch
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTSignalEvent
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Signal

class XTSignalEventRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new XTSignalEventMapping(engine)
		}
	}
}

/**
 * FIXME signal events are related to protocol signals and not dependent on transition triggers
 */
class XTSignalEventMapping extends AbstractObjectMapping<XtSignalEventMatch, Signal, XTSignalEvent> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		XTSignalEvent
	}
	
	public static val PRIORITY = XTClassMapping.PRIORITY + 1
	
	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		xtSignalEvent
	}

	override getUmlObject(XtSignalEventMatch match) {
		match.signal
	}

	override createXtumlrtObject() {
		xtumlFactory.createXTSignalEvent
	}

	override updateXtumlrtObject(XTSignalEvent xtumlrtObject, XtSignalEventMatch match) {
	}

	def getXtumlrtContainer(XtSignalEventMatch match) {
		match.umlClass.findXtumlrtObject(XTClass)
	}

	override protected insertXtumlrtObject(XTSignalEvent xtumlrtObject, XtSignalEventMatch match) {
		match.xtumlrtContainer.events += xtumlrtObject
	}

}
