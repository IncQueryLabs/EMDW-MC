package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.Connector
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static extension com.incquerylabs.emdw.testing.common.utils.UmlUtil.*

@SuiteClasses(#[
	ConnectorMappingTest
])
@RunWith(Suite)
class ConnectorMappingTestSuite {}

class ConnectorMappingTest extends TransformationTest<org.eclipse.uml2.uml.Connector, Connector> {

	override protected createUmlObject(Model umlRoot) {
		val component = umlRoot.createComponentInModel
		component.createConnector
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.entities.head as XTComponent).connectors
	}

	override protected checkXtumlrtObject(RootMapping mapping, org.eclipse.uml2.uml.Connector umlObject, Connector xtumlrtObject) {
	}

}
