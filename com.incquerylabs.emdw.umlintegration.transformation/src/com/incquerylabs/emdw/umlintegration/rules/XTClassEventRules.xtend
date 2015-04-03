package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtClassEventMatch
import com.zeligsoft.xtumlrt.xtuml.XTClass
import com.zeligsoft.xtumlrt.xtuml.XTClassEvent
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Signal

class XTClassEventRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new XTClassEventMapping(engine).specification
		}
	}
}

class XTClassEventMapping extends AbstractObjectRule<XtClassEventMatch, Signal, XTClassEvent> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		XTClassEvent
	}
	
	override getRulePriority() {
		XTClassMapping.PRIORITY + 1
	}

	override getQuerySpecification() {
		xtClassEvent
	}

	override getUmlObject(XtClassEventMatch match) {
		match.signal
	}

	override createXtumlrtObject() {
		xtumlFactory.createXTClassEvent
	}

	override updateXtumlrtObject(XTClassEvent xtumlrtObject, XtClassEventMatch match) {
	}

	def getXtumlrtContainer(XtClassEventMatch match) {
		match.umlClass.findXtumlrtObject(XTClass)
	}

	override protected insertXtumlrtObject(XTClassEvent xtumlrtObject, XtClassEventMatch match) {
		match.xtumlrtContainer.events += xtumlrtObject
	}

}
