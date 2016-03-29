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

import com.incquerylabs.emdw.umlintegration.queries.StructTypeMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.StructuredType
import org.eclipse.papyrusrt.xtumlrt.common.TypeDefinition
import org.eclipse.uml2.uml.DataType

class StructTypeRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new StructTypeMapping(engine)
		}
	}
}

/**
 * Transforms DataTypes with at least one member which are a Package's or a Component's packaged elements to the Model's local scope temporary types
 */
class StructTypeMapping extends AbstractObjectMapping<StructTypeMatch, DataType, StructuredType> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		StructuredType
	}
	
	public static val PRIORITY = TypeDefinitionMapping.PRIORITY + 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		structType
	}

	override getUmlObject(StructTypeMatch match) {
		match.structType
	}

	override createXtumlrtObject() {
		commonFactory.createStructuredType
	}

	override updateXtumlrtObject(StructuredType xtumlrtObject, StructTypeMatch match) {
	}
	
	def getXtumlContainer(StructTypeMatch match) {
		match.structType.findXtumlrtObject(TypeDefinition)
	}

	override protected void insertXtumlrtObject(StructuredType xtumlrtObject, StructTypeMatch match) {
		match.xtumlContainer.type = xtumlrtObject
	}
}
