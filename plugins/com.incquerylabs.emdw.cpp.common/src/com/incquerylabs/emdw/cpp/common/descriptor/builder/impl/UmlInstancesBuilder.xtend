package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplInstancesBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlInstancesBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.uml2.uml.Type

class UmlInstancesBuilder implements IUmlInstancesBuilder {
	private UmlToXtumlMapper mapper
	private IOoplInstancesBuilder builder
	
	private Type type
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppInstancesBuilder(engine)
	}
	
	override build() {
		val xtClass = mapper.convertType(type) as XTClass
		return (builder => [
					it.ooplClass = xtClass
				]).build
	}
	
	override setUmlClass(Type type) {
		this.type = type
		return this
	}
	
}