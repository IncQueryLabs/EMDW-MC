package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtClassEventMatch
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Signal

class XTClassEventRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new XTClassEventMapping(engine)
		}
	}
}

/**
 * Transforms Signals which are a Class's nested classifiers to the transformed XTClass's events.
 */
class XTClassEventMapping extends AbstractObjectMapping<XtClassEventMatch, Signal, XTClassEvent> {

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
