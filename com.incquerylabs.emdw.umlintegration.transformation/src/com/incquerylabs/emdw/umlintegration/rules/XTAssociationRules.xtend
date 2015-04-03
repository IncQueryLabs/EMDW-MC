package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtAssociationMatch
import com.zeligsoft.xtumlrt.xtuml.XTAssociation
import com.zeligsoft.xtumlrt.xtuml.XTClass
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Property

class XTAssociationRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new XTAssociationMapping(engine).specification,
			new XTAssociationOppositeMapping(engine).specification
		}
	}
}

class XTAssociationMapping extends AbstractObjectRule<XtAssociationMatch, Property, XTAssociation> {

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
		match.sourceEnd
	}

	override createXtumlrtObject() {
		xtumlFactory.createXTAssociation
	}

	override updateXtumlrtObject(XTAssociation xtumlrtObject, XtAssociationMatch match) {
		xtumlrtObject.source = match.sourceEnd.xtumlrtObjectOfType
		xtumlrtObject.target = match.targetEnd.xtumlrtObjectOfType
		xtumlrtObject.name = '''«match.association.name»_«match.sourceEnd.name»'''
	}
	
	def xtumlrtObjectOfType(Property end) {
		end.type.findXtumlrtObject(XTClass)
	}

	override protected insertXtumlrtObject(XTAssociation xtumlrtObject, XtAssociationMatch match) {
		match.sourceEnd.xtumlrtObjectOfType.relations += xtumlrtObject
	}

}

class XTAssociationOppositeMapping extends AbstractRecursiveReferenceRule<XtAssociationMatch, XTAssociation> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		XTAssociationMapping.PRIORITY + 1
	}

	override getQuerySpecification() {
		xtAssociation
	}

	override findSource(XtAssociationMatch match) {
		match.sourceEnd.findAssociation
	}
	
	override findTarget(XtAssociationMatch match) {
		match.targetEnd.findAssociation
	}
	
	def findAssociation(Property end) {
		end.findXtumlrtObject(XTAssociation)
	}
	
	override addTarget(XTAssociation source, XTAssociation target) {
		source.opposite = target
		target.opposite = source
	}
	
	override removeTarget(XTAssociation source, XTAssociation target) {
		source.opposite = null
		target.opposite = null
	}

}