/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Denes Harmath - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtAssociationMatch
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociation
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Property

class XTAssociationRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new XTAssociationMapping(engine),
			new XTAssociationOppositeMapping(engine)
		}
	}
}

/**
 * Transforms Associations with exactly 2 owned ends to the relations of the XTClass transformed from their source end type.
 * Transformed fields: source, target.
 */
class XTAssociationMapping extends AbstractObjectMapping<XtAssociationMatch, Property, XTAssociation> {

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
		match.targetEnd
	}

	override createXtumlrtObject() {
		xtumlFactory.createXTAssociation
	}

	override updateXtumlrtObject(XTAssociation xtumlrtObject, XtAssociationMatch match) {
		xtumlrtObject.source = match.sourceEnd.xtumlrtObjectOfType
		xtumlrtObject.target = match.targetEnd.xtumlrtObjectOfType
		xtumlrtObject.name = '''«match.association.name»_«match.targetEnd.name»'''
		
		xtumlrtObject.upperBound = match.targetEnd.upper
		xtumlrtObject.lowerBound = match.targetEnd.lower
		xtumlrtObject.ordered = match.targetEnd.isOrdered
		xtumlrtObject.unique = match.targetEnd.isUnique
	}
	
	def xtumlrtObjectOfType(Property end) {
		end.type.findXtumlrtObject(XTClass)
	}

	override protected insertXtumlrtObject(XTAssociation xtumlrtObject, XtAssociationMatch match) {
		match.sourceEnd.xtumlrtObjectOfType.relations += xtumlrtObject
	}

}

/**
 * Maintains the opposite references of XTAssociations.
 */
class XTAssociationOppositeMapping extends AbstractRecursiveReferenceMapping<XtAssociationMatch, XTAssociation> {

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