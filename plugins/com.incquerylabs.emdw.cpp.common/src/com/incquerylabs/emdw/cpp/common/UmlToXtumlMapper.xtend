package com.incquerylabs.emdw.cpp.common

import com.incquerylabs.emdw.cpp.common.queries.UmlQueries
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Element

class UmlToXtumlMapper {
	extension UmlQueries umlQueries = UmlQueries.instance
	private AdvancedIncQueryEngine engine
	
	new(AdvancedIncQueryEngine engine) {
		this.engine = engine
		umlQueries.prepare(engine)
	}
	
	def convertClass(Element umlClass) {
		engine.xtClass2UmlClass.getAllValuesOfxtumlClass(umlClass).head
	}
	
	def convertType(Element umlType) {
		engine.type2UmlElement.getAllValuesOfxtumlType(umlType).head
	}
}