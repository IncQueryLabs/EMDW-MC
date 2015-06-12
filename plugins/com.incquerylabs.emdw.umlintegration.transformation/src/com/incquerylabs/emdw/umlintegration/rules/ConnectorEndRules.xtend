package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ConnectorEndMatch
import org.eclipse.papyrusrt.xtumlrt.common.CapsulePart
import org.eclipse.papyrusrt.xtumlrt.common.Connector
import org.eclipse.papyrusrt.xtumlrt.common.ConnectorEnd
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPort
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine

class ConnectorEndRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new ConnectorEndMapping(engine)
		}
	}
}

/**
 * Transforms ConnectorEnds to the Connector's ends which is transformed from their connector.
 */
class ConnectorEndMapping extends AbstractObjectMapping<ConnectorEndMatch, org.eclipse.uml2.uml.ConnectorEnd, ConnectorEnd> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		ConnectorEnd
	}
	
	public static val PRIORITY = #{ConnectorMapping.PRIORITY, CapsulePartMapping.PRIORITY, XTPortMapping.PRIORITY}.max + 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		connectorEnd
	}

	override getUmlObject(ConnectorEndMatch match) {
		match.connectorEnd
	}

	override createXtumlrtObject() {
		commonFactory.createConnectorEnd
	}

	override updateXtumlrtObject(ConnectorEnd xtumlrtObject, ConnectorEndMatch match) {
		if (match.connectorEnd.partWithPort != null) {
			xtumlrtObject.partWithPort = match.partWithPort
		}
		xtumlrtObject.role = match.role
	}

	def getPartWithPort(ConnectorEndMatch match) {
		match.connectorEnd.partWithPort.findXtumlrtObject(CapsulePart)
	}
	
	def getRole(ConnectorEndMatch match) {
		match.connectorEnd.role.findXtumlrtObject(XTPort)
	}

	def getXtumlrtContainer(ConnectorEndMatch match) {
		match.connector.findXtumlrtObject(Connector)
	}

	override insertXtumlrtObject(ConnectorEnd xtumlrtObject, ConnectorEndMatch match) {
		match.xtumlrtContainer.ends += xtumlrtObject
	}
	
}
