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
package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.ConnectorEnd
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	ConnectorEndMappingTest
])
@RunWith(Suite)
class ConnectorEndMappingTestSuite {}

class ConnectorEndMappingTest extends TransformationTest<org.eclipse.uml2.uml.ConnectorEnd, ConnectorEnd> {

	override protected createUmlObject(Model umlRoot) {
		val component = umlRoot.createComponentInModel
		val connector = component.createConnector
		val role = component.createPort
		val partWithPort = component.createPropertyForPart
		connector.createConnectorEnd(role, partWithPort)
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.entities.head as XTComponent).connectors.head.ends
	}

	override protected checkXtumlrtObject(RootMapping mapping, org.eclipse.uml2.uml.ConnectorEnd umlObject, ConnectorEnd xtumlrtObject) {
		val role = mapping.traces.findFirst[umlElements.contains(umlObject.role)].xtumlrtElements.head
		val partWithPort = mapping.traces.findFirst[umlElements.contains(umlObject.partWithPort)].xtumlrtElements.head
		assertEquals("Connector end role", role, xtumlrtObject.role)
		assertEquals("Connector end part with port", partWithPort, xtumlrtObject.partWithPort)
	}

}
