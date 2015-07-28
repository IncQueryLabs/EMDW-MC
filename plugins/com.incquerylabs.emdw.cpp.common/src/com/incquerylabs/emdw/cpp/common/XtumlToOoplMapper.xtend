package com.incquerylabs.emdw.cpp.common

import com.incquerylabs.emdw.cpp.common.queries.XtumlQueries
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Type

class XtumlToOoplMapper {
	extension XtumlQueries xtumlQueries = XtumlQueries.instance
	private AdvancedIncQueryEngine engine
	
	new(AdvancedIncQueryEngine engine) {
		this.engine = engine
		xtumlQueries.prepare(engine)
	}
	
	def convertType(Type type) {
		engine.ooplType2Type.getAllValuesOfooplType(type).head
	}
}