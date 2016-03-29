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

import com.incquerylabs.emdw.umlintegration.queries.StructMemberMatch
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import org.eclipse.papyrusrt.xtumlrt.common.StructuredType
import org.eclipse.uml2.uml.Property
import org.eclipse.papyrusrt.xtumlrt.common.Type

class StructMemberRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new StructMemberMapping(engine)
		}
	}
}

/**
 * Transforms Properties which are a DataType owned attribute to the transformed StructType's struct members.
 */
class StructMemberMapping extends AbstractObjectMapping<StructMemberMatch, Property, Attribute> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		Attribute
	}
	
	public static val PRIORITY = StructTypeMapping.PRIORITY + 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		structMember
	}

	override getUmlObject(StructMemberMatch match) {
		match.member
	}

	override createXtumlrtObject() {
		commonFactory.createAttribute
	}

	override updateXtumlrtObject(Attribute xtAttribute, StructMemberMatch match) {
		val umlProperty = match.umlObject
		val xtType = engine.trace.getAllValuesOfxtumlrtElement(null, null, umlProperty.type).filter(Type).head
		TransformationUtil.updateAttribute(umlProperty, xtAttribute, xtType)
	}

	def getXtumlrtContainer(StructMemberMatch match) {
		match.structType.findXtumlrtObject(StructuredType)
	}
	
	override protected insertXtumlrtObject(Attribute xtumlrtObject, StructMemberMatch match) {
		match.xtumlrtContainer.attributes += xtumlrtObject
	}
	
}
