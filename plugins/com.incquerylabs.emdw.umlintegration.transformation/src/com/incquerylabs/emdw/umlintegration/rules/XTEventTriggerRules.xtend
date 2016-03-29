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

import com.incquerylabs.emdw.umlintegration.queries.XtEventTriggerMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Transition
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEvent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEventTrigger
import org.eclipse.uml2.uml.SignalEvent
import org.eclipse.uml2.uml.Trigger

class XTEventTriggerRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new XTEventTriggerMapping(engine)
		}
	}
}

/**
 * Transforms Triggers which are a Transition's triggers to the transformed Transition's triggers.
 */
class XTEventTriggerMapping extends AbstractObjectMapping<XtEventTriggerMatch, Trigger, XTEventTrigger> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		XTEventTrigger
	}

	public static val PRIORITY = Math.max(TransitionMapping.PRIORITY + 1, XTSignalEventMapping.PRIORITY + 1)
	
	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		xtEventTrigger
	}

	override getUmlObject(XtEventTriggerMatch match) {
		match.trigger
	}

	override createXtumlrtObject() {
		xtumlFactory.createXTEventTrigger
	}

	override updateXtumlrtObject(XTEventTrigger xtumlrtObject, XtEventTriggerMatch match) {
		switch event : match.trigger.event {
			SignalEvent: {
				xtumlrtObject.signal = event.signal.findXtumlrtObject(XTEvent)
			} 
		}
	}

	def getXtumlrtContainer(XtEventTriggerMatch match) {
		match.transition.findXtumlrtObject(Transition)
	}

	override insertXtumlrtObject(XTEventTrigger xtumlrtObject, XtEventTriggerMatch match) {
		match.xtumlrtContainer.triggers += xtumlrtObject
	}
	
}
