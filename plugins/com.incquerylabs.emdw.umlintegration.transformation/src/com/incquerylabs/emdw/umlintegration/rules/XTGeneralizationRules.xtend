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

import com.incquerylabs.emdw.umlintegration.queries.XtGeneralizationMatch
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
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
class XTGeneralizationMapping extends AbstractObjectMapping<XtGeneralizationMatch, Generalization, org.eclipse.papyrusrt.xtumlrt.common.Generalization> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getXtumlrtClass() {
		org.eclipse.papyrusrt.xtumlrt.common.Generalization
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
		commonFactory.createGeneralization
	}

	override updateXtumlrtObject(org.eclipse.papyrusrt.xtumlrt.common.Generalization xtumlrtObject, XtGeneralizationMatch match) {
		xtumlrtObject.sub = match.subClass.findClass
		xtumlrtObject.^super = match.generalization.general.findClass
	}
	
	def findClass(Element element) {
		element.findXtumlrtObject(XTClass)
	}

	override protected insertXtumlrtObject(org.eclipse.papyrusrt.xtumlrt.common.Generalization xtumlrtObject, XtGeneralizationMatch match) {
		match.subClass.findClass.generalizations += xtumlrtObject
	}

}