package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtGeneralizationMatch
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTGeneralization
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Element
import org.eclipse.uml2.uml.Generalization

class XTGeneralizationRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new XTGeneralizationMapping(engine)
		}
	}
}

/**
 * Transforms Generalizations which are a Class's generalizations to the transformed XTClass's relations (which is the subclass).
 * Transformed fields: sub, super.
 */
class XTGeneralizationMapping extends AbstractObjectMapping<XtGeneralizationMatch, Generalization, XTGeneralization> {

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