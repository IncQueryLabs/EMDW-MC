package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.common.ConnectorEnd
import com.zeligsoft.xtumlrt.xtuml.XTComponent
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import static org.junit.Assert.*
import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import org.eclipse.uml2.uml.Model

@RunWith(Parameterized)
class ConnectorEndMappingTest extends TransformationTest<org.eclipse.uml2.uml.ConnectorEnd, ConnectorEnd> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val component = createComponentInModel(umlRoot)
		val connector = createConnector(component)
		val role = createPort(component)
		val partWithPort = createPropertyForPart(component)
		createConnectorEnd(connector, role, partWithPort)
	}

	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.topEntities.head as XTComponent).connectors.head.ends
	}

	override protected checkXtumlrtObject(RootMapping mapping, org.eclipse.uml2.uml.ConnectorEnd umlObject, ConnectorEnd xtumlrtObject) {
		val role = mapping.traces.findFirst[umlElements.contains(umlObject.role)].xtumlrtElements.head
		val partWithPort = mapping.traces.findFirst[umlElements.contains(umlObject.partWithPort)].xtumlrtElements.head
		assertEquals("Connector end role", role, xtumlrtObject.role)
		assertEquals("Connector end part with port", partWithPort, xtumlrtObject.partWithPort)
	}

}
