package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtClassEventGeneralizationMatch
import com.incquerylabs.emdw.umlintegration.queries.XtClassEventMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent
import org.eclipse.uml2.uml.Signal

class XTClassEventRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new XTClassEventMapping(engine),
			new XTClassEventGeneralizationMapping(engine)
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
		CommonPriorities.EVENT_MAPPING_PRIORITY
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
class XTClassEventGeneralizationMapping extends AbstractRecursiveReferenceMapping<XtClassEventGeneralizationMatch, XTClassEvent> {
	
	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		CommonPriorities.EVENT_MAPPING_PRIORITY + 1
	}
	
	override getQuerySpecification() {
		xtClassEventGeneralization
	}
	
	override protected findSource(XtClassEventGeneralizationMatch match) {
		match.signal.findXTClassEvent
	}
	
	override protected findTarget(XtClassEventGeneralizationMatch match) {
		match.superSignal.findXTClassEvent
	}
	
	def findXTClassEvent(Signal signal) {
		signal.findXtumlrtObject(XTClassEvent)
	}
	
	override protected addTarget(XTClassEvent source, XTClassEvent target) {
		source.definingEvents += target
	}
	
	override protected removeTarget(XTClassEvent source, XTClassEvent target) {
		if (source.definingEvents.contains(target)) {
			source.definingEvents.remove(target)
		}
	}

}
