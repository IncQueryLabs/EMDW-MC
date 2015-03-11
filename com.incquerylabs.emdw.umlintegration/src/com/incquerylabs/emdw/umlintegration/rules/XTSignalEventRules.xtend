package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtSignalEventMatch
import com.zeligsoft.xtumlrt.xtuml.XTClass
import com.zeligsoft.xtumlrt.xtuml.XTSignalEvent
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Signal

class XTSignalEventRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new XTSignalEventMapping(engine).specification
		}
	}
}

class XTSignalEventMapping extends AbstractObjectRule<XtSignalEventMatch, Signal, XTSignalEvent> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		XTSignalEvent
	}
	
	override getRulePriority() {
		XTClassMapping.PRIORITY + 1
	}

	override getQuerySpecification() {
		xtSignalEvent
	}

	override getUmlObject(XtSignalEventMatch match) {
		match.signal
	}

	override createXtumlrtObject(Signal umlObject, XtSignalEventMatch match) {
		xtumlFactory.createXTSignalEvent
	}

	override updateXtumlrtObject(XTSignalEvent xtumlrtObject, XtSignalEventMatch match) {
	}

	def getXtumlrtContainer(XtSignalEventMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.umlClass).head as XTClass
	}

	override protected insertXtumlrtObject(XTSignalEvent xtumlrtObject, XtSignalEventMatch match) {
		match.xtumlrtContainer.events += xtumlrtObject
	}

}
