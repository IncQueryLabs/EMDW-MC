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

import java.util.Set
import org.eclipse.emf.ecore.xml.type.internal.RegEx.Match
import org.eclipse.incquery.runtime.api.IncQueryEngine
import com.incquerylabs.emdw.umlintegration.queries.EnumerationLiteralMatch
import org.eclipse.papyrusrt.xtumlrt.common.EnumerationLiteral
import org.eclipse.papyrusrt.xtumlrt.common.Enumeration

class EnumerationLiteralRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new EnumerationLiteralMapping(engine)
		}
	}
}

class EnumerationLiteralMapping extends AbstractObjectMapping<EnumerationLiteralMatch, org.eclipse.uml2.uml.EnumerationLiteral, EnumerationLiteral> {
	
	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override protected getXtumlrtClass() {
		EnumerationLiteral
	}
	
	public static val PRIORITY = EnumerationMapping.PRIORITY + 1
	
	override getRulePriority() {
		PRIORITY
	}
	
	override getQuerySpecification() {
		enumerationLiteral
	}
	
	override protected getUmlObject(EnumerationLiteralMatch match) {
		match.enumerationLiteral
	}
	
	override protected createXtumlrtObject() {
		commonFactory.createEnumerationLiteral
	}
	
	override protected updateXtumlrtObject(EnumerationLiteral xtumlrtObject, EnumerationLiteralMatch match) {
		val umlEnum = match.enumeration
		val firstLiteral = umlEnum.ownedLiterals.head
		if(match.enumerationLiteral == firstLiteral) {
			val xtumlrtEnum = xtumlrtObject.eContainer as Enumeration
			if(xtumlrtEnum.defaultValue != xtumlrtObject) {
				xtumlrtEnum.defaultValue = xtumlrtObject
				logger.trace('''Updated enumeration literal «xtumlrtObject.name» as default value of «xtumlrtEnum.name»''')
			}
		}
	}
	
	def getXtumlContainer(EnumerationLiteralMatch match) {
		match.enumeration.findXtumlrtObject(Enumeration)
	}
	
	override protected insertXtumlrtObject(EnumerationLiteral xtumlrtObject, EnumerationLiteralMatch match) {
		match.xtumlContainer.literals += xtumlrtObject
	}
}