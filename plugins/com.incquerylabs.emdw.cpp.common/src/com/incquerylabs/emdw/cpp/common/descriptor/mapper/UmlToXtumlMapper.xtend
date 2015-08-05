package com.incquerylabs.emdw.cpp.common.descriptor.mapper

import com.incquerylabs.emdw.cpp.common.descriptor.queries.UmlQueries
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Element

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
	def convertType(Element umlType) {
		engine.type2UmlElement.getAllValuesOfxtumlType(umlType).head
	}
}