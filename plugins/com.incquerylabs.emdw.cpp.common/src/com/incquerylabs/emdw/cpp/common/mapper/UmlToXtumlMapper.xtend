package com.incquerylabs.emdw.cpp.common.mapper

import com.incquerylabs.emdw.cpp.common.mapper.queries.UmlQueries
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Property
import org.eclipse.uml2.uml.Type

class UmlToXtumlMapper {
	extension UmlQueries umlQueries = UmlQueries.instance
	private AdvancedIncQueryEngine engine
	
	/**
	 * @param engine Cannot be null
	 */
	new(AdvancedIncQueryEngine engine) {
		this.engine = engine
		umlQueries.prepare(engine)
	}
	
	/**
	 * @param umlType Cannot be null
	 * 
	 * @return The xtUML pair of the <code>umlType</code>
	 */
	def convertType(Type umlType) {
		return engine.type2UmlElement.getAllValuesOfxtumlType(umlType).head
	}
	
	/**
	 * @param umlProperty Cannot be null
	 * 
	 * @return The xtUML pair of the <code>umlProperty</code>
	 */
	def convertProperty(Property umlProperty) {
		return engine.attribute2UmlProperty.getAllValuesOfxtumlAttribute(umlProperty).head
	}
}