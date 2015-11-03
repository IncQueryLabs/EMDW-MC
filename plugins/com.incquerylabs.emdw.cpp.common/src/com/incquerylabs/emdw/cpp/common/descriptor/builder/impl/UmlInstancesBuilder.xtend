package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplInstancesBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlInstancesBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.uml2.uml.Type

class UmlInstancesBuilder implements IUmlInstancesBuilder {
	extension Logger logger = Logger.getLogger(class)
	
	private UmlToXtumlMapper mapper
	private IOoplInstancesBuilder builder
	
	private Type type
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppInstancesBuilder(engine)
	}
	
	override build() {
		trace('''Started building''')
		val xtClass = mapper.convertType(type) as XTClass
		trace('''Resolved class: «xtClass.name»''')
		val cvd = (builder => [
					it.ooplClass = xtClass
				]).build
		trace('''Finished building''')
		return cvd
	}
	
	override setUmlClass(Type type) {
		this.type = type
		return this
	}
	
}