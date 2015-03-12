package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtClassMatch
import com.zeligsoft.xtumlrt.xtuml.XTClass
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Class

class XTClassRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new XTClassMapping(engine).specification
		}
	}
}

class XTClassMapping extends AbstractObjectRule<XtClassMatch, Class, XTClass> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		XTClass
	}
	
	public static val PRIORITY = 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		xtClass
	}

	override getUmlObject(XtClassMatch match) {
		match.umlClass
	}

	override createXtumlrtObject(Class umlObject, XtClassMatch match) {
		xtumlFactory.createXTClass
	}

	override updateXtumlrtObject(XTClass xtumlrtObject, XtClassMatch match) {
	}

	def getXtumlrtContainer() {
		rootMapping.xtumlrtRoot.topEntities
	}

	override protected insertXtumlrtObject(XTClass xtumlrtObject, XtClassMatch match) {
		xtumlrtContainer += xtumlrtObject
	}
	
}
