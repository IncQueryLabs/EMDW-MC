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

import com.incquerylabs.emdw.umlintegration.queries.ModelMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Element
import org.eclipse.papyrusrt.xtumlrt.common.Model

class ModelRules {
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new ModelMapping(engine)
		}
	}
}

class ModelMapping extends AbstractMapping<ModelMatch> {
	
	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getQuerySpecification() {
		model
	}
	
	override getRulePriority() {
		return CommonPriorities.VERTEX_MAPPING_PRIORITY
	}
	
	protected def getXtumlrtClass() {
		Model
	}
	
	override def appeared(ModelMatch match) {
		logger.debug('''UML model appeared «match.model»''')
	}
	
	override def updated(ModelMatch match) {
		val umlObject = match.model
		if (umlObject.equals(rootMapping.umlRoot)){
			val xtumlrtObject = rootMapping.xtumlrtRoot
			xtumlrtObject.name = umlObject.name
			logger.debug('''Updated xtuml model «xtumlrtObject»''')
		}
	}
	
	override def disappeared(ModelMatch match) {
	}
	
//	private def findTrace(Element umlObject) {
//		engine.trace.getAllMatches(rootMapping, null, umlObject, null).filter[xtumlrtClass.isAssignableFrom(xtumlrtElement.class)].head
//	}
}