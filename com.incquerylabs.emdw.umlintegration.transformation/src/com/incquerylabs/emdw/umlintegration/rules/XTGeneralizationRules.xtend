package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtGeneralizationMatch
import com.zeligsoft.xtumlrt.xtuml.XTClass
import com.zeligsoft.xtumlrt.xtuml.XTGeneralization
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Element
import org.eclipse.uml2.uml.Generalization

class XTGeneralizationRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new XTGeneralizationMapping(engine).specification
		}
	}
}

class XTGeneralizationMapping extends AbstractObjectRule<XtGeneralizationMatch, Generalization, XTGeneralization> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		XTGeneralization
	}
	
	public static val PRIORITY = XTClassMapping.PRIORITY + 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		xtGeneralization
	}

	override getUmlObject(XtGeneralizationMatch match) {
		match.generalization
	}

	override createXtumlrtObject() {
		xtumlFactory.createXTGeneralization
	}

	override updateXtumlrtObject(XTGeneralization xtumlrtObject, XtGeneralizationMatch match) {
		xtumlrtObject.sub = match.subClass.findClass
		xtumlrtObject.^super = match.generalization.general.findClass
	}
	
	def findClass(Element element) {
		element.findXtumlrtObject(XTClass)
	}

	override protected insertXtumlrtObject(XTGeneralization xtumlrtObject, XtGeneralizationMatch match) {
		match.subClass.findClass.relations += xtumlrtObject
	}

}