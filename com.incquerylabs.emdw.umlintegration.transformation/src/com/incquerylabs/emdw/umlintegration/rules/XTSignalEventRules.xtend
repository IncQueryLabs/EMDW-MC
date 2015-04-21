package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtSignalEventMatch
import com.zeligsoft.xtumlrt.xtuml.XTClass
import com.zeligsoft.xtumlrt.xtuml.XTSignalEvent
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
 * Transforms Signals which are a Class's classifier behavior's transition's trigger's event's signals to the transformed XTClass's events.
 * The Signal must also be an Interface's nested classifier.
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
