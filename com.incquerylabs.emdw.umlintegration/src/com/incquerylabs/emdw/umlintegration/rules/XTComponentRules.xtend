package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtComponentMatch
import com.zeligsoft.xtumlrt.xtuml.XTComponent
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Class

class XTComponentRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new XTComponentMapping(engine).specification
		}
	}
}

class XTComponentMapping extends AbstractObjectRule<XtComponentMatch, Class, XTComponent> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		XTComponent
	}
	
	public static val PRIORITY = 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		xtComponent
	}

	override getUmlObject(XtComponentMatch match) {
		match.component
	}

	override createXtumlrtObject(Class umlObject, XtComponentMatch match) {
		xtumlFactory.createXTComponent
	}

	override updateXtumlrtObject(XTComponent xtumlrtObject, XtComponentMatch match) {
	}

	def getXtumlrtContainer() {
		rootMapping.xtumlrtRoot.topEntities
	}

	override protected insertXtumlrtObject(XTComponent xtumlrtObject, XtComponentMatch match) {
		xtumlrtContainer += xtumlrtObject
	}
	
}
