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

import com.incquerylabs.emdw.umlintegration.queries.ConnectorMatch
import org.eclipse.papyrusrt.xtumlrt.common.Connector
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine

class ConnectorRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new ConnectorMapping(engine)
		}
	}
}

/**
 * Transforms Connectors which are a Component's connectors to the transformed XTComponent's connectors.
 */
class ConnectorMapping extends AbstractObjectMapping<ConnectorMatch, org.eclipse.uml2.uml.Connector, Connector> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		Connector
	}
	
	public static val PRIORITY = XTComponentMapping.PRIORITY + 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		connector
	}

	override getUmlObject(ConnectorMatch match) {
		match.connector
	}

	override createXtumlrtObject() {
		commonFactory.createConnector
	}

	override updateXtumlrtObject(Connector xtumlrtObject, ConnectorMatch match) {
	}

	def getXtumlrtContainer(ConnectorMatch match) {
		match.component.findXtumlrtObject(XTComponent)
	}

	override insertXtumlrtObject(Connector xtumlrtObject, ConnectorMatch match) {
		match.xtumlrtContainer.connectors += xtumlrtObject
	}
	
}
