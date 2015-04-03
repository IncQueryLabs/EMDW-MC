package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtPortMatch
import com.zeligsoft.xtumlrt.xtuml.XTComponent
import com.zeligsoft.xtumlrt.xtuml.XTPort
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Port

class XTPortRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new XTPortMapping(engine).specification
		}
	}
}

class XTPortMapping extends AbstractObjectRule<XtPortMatch, Port, XTPort> {

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
