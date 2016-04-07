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

import com.incquerylabs.emdw.umlintegration.queries.CapsulePartMatch
import org.eclipse.papyrusrt.xtumlrt.common.CapsulePart
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Property

class CapsulePartRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new CapsulePartMapping(engine)
		}
	}
}

/**
 * Transforms Properties except of Ports which are a Component's owned attributes to the transformed XTComponent's parts.
 */
class CapsulePartMapping extends AbstractObjectMapping<CapsulePartMatch, Property, CapsulePart> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		CapsulePart
	}
	
	public static val PRIORITY = XTComponentMapping.PRIORITY + 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		capsulePart
	}

	override getUmlObject(CapsulePartMatch match) {
		match.property
	}

	override createXtumlrtObject() {
		commonFactory.createCapsulePart
	}

	override updateXtumlrtObject(CapsulePart xtumlrtObject, CapsulePartMatch match) {
	}

	def getXtumlrtContainer(CapsulePartMatch match) {
		match.component.findXtumlrtObject(XTComponent)
	}

	override insertXtumlrtObject(CapsulePart xtumlrtObject, CapsulePartMatch match) {
		match.xtumlrtContainer.parts += xtumlrtObject
	}
	
}
