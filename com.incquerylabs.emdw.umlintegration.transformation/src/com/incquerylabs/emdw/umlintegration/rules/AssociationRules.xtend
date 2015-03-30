package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtAssociationMatch
import com.zeligsoft.xtumlrt.xtuml.XTAssociation
import com.zeligsoft.xtumlrt.xtuml.XTClass
import com.zeligsoft.xtumlrt.xtuml.XTComponent
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Association

class XTAssociationRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new XTAssociationMapping(engine).specification
		}
	}
}

class XTAssociationMapping extends AbstractObjectRule<XtAssociationMatch, Association, XTAssociation> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		XTAssociation
	}
	
	public static val PRIORITY = XTClassMapping.PRIORITY + 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		xtAssociation
	}

	override getUmlObject(XtAssociationMatch match) {
		match.association
	}

	override createXtumlrtObject(Association umlObject, XtAssociationMatch match) {
		xtumlFactory.createXTAssociation
	}

	override updateXtumlrtObject(XTAssociation xtumlrtObject, XtAssociationMatch match) {
		xtumlrtObject.source = match.getEnd(0)
		xtumlrtObject.target = match.getEnd(1)
	}
	
	def getEnd(XtAssociationMatch match, int index) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.association.ownedEnds.get(index).type).head as XTClass
	}

	def getXtumlrtContainer(XtAssociationMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.component).head as XTComponent
	}
	
	override protected insertXtumlrtObject(XTAssociation xtumlrtObject, XtAssociationMatch match) {
		match.xtumlrtContainer.relations += xtumlrtObject
	}

}

/*
TODO
class XTAssociationOppositeMapping extends AbstractRecursiveReferenceRule<XtAssociationOppositeMatch, XTAssociation> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		XTAssociationMapping.PRIORITY + 1
	}

	override getQuerySpecification() {
		xtAssociationOpposite
	}

	override findParent(XtAssociationOppositeMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.source).head as XTAssociation
	}
	
	override findChild(XtAssociationOppositeMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.target).head as XTAssociation
	}
	
	override addTarget(XTAssociation source, XTAssociation target) {
		source.opposite = target
	}
	
	override removeTarget(XTAssociation source, XTAssociation target) {
		source.opposite = null
	}

}
*/
