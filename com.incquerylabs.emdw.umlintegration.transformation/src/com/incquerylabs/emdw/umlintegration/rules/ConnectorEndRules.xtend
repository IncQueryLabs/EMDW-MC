package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ConnectorEndMatch
import com.zeligsoft.xtumlrt.common.CapsulePart
import com.zeligsoft.xtumlrt.common.Connector
import com.zeligsoft.xtumlrt.common.ConnectorEnd
import com.zeligsoft.xtumlrt.xtuml.XTPort
import org.eclipse.incquery.runtime.api.IncQueryEngine

class ConnectorEndRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new ConnectorEndMapping(engine).specification
		}
	}
}

class ConnectorEndMapping extends AbstractObjectRule<ConnectorEndMatch, org.eclipse.uml2.uml.ConnectorEnd, ConnectorEnd> {

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

	override createXtumlrtObject(org.eclipse.uml2.uml.ConnectorEnd umlObject, ConnectorEndMatch match) {
		commonFactory.createConnectorEnd
	}

	override updateXtumlrtObject(ConnectorEnd xtumlrtObject, ConnectorEndMatch match) {
		xtumlrtObject.partWithPort = match.partWithPort
		xtumlrtObject.role = match.role
	}

	def getPartWithPort(ConnectorEndMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.connectorEnd.partWithPort).head as CapsulePart
	}
	
	def getRole(ConnectorEndMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.connectorEnd.role).head as XTPort
	}

	def getXtumlrtContainer(ConnectorEndMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.connector).head as Connector
	}

	override insertXtumlrtObject(ConnectorEnd xtumlrtObject, ConnectorEndMatch match) {
		match.xtumlrtContainer.ends += xtumlrtObject
	}
	
}