package com.incquerylabs.emdw.cpp.common.mapper

import com.incquerylabs.emdw.cpp.common.mapper.queries.XtumlQueries
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import org.eclipse.papyrusrt.xtumlrt.common.Type

class XtumlToOoplMapper {
	extension XtumlQueries xtumlQueries = XtumlQueries.instance
	private AdvancedIncQueryEngine engine
	
	/**
	 * @param engine Cannot be null
	 */
	new(AdvancedIncQueryEngine engine) {
		this.engine = engine
		xtumlQueries.prepare(engine)
	}
	
	/**
	 * @param type Cannot be null
	 * 
	 * @return The OOPL pair of the xtUML <code>type</code>
	 */
	def convertType(Type type) {
		engine.ooplType2Type.getAllValuesOfooplType(type).head
	}
	
	def convertAttribute(Attribute attribute) {
		return engine.ooplAttribute2Attribute.getAllValuesOfooplAttribute(attribute).head
	}
}