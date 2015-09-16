package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplCopyConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCopyConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent
import org.eclipse.uml2.uml.Signal
import org.eclipse.uml2.uml.Type

class UmlCopyConstructorCallBuilder implements IUmlCopyConstructorCallBuilder {
	private UmlToXtumlMapper mapper
	private IOoplCopyConstructorCallBuilder builder
	
	private Type type
	private ValueDescriptor param
	
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppCopyConstructorCallBuilder(engine)
	}
	
	
	override build() {
		if(type instanceof Signal) {
			val xtEvent = mapper.convertSignal(type) as XTClassEvent
			return (builder => [
						it.event = xtEvent
						it.parameter = param
					]).build
		}
	}
	
	override setType(Type type) {
		this.type = type
		return this
	}
	
	override setParameter(ValueDescriptor param) {
		this.param = param
		return this
	}
}