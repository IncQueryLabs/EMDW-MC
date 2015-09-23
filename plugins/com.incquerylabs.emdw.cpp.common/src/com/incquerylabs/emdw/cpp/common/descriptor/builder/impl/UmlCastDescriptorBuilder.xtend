package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplCastDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCastDescriptorBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.uml2.uml.Type
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine

class UmlCastDescriptorBuilder implements IUmlCastDescriptorBuilder {
	private IOoplCastDescriptorBuilder builder
	private UmlToXtumlMapper mapper
	
	private Type type
	private ValueDescriptor descriptor
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppCastDescriptorBuilder(engine)
	}
	
	override setDescriptor(ValueDescriptor castableDescriptor) {
		this.descriptor = castableDescriptor
		this
	}
	
	override setCastingType(Type castingType) {
		this.type = castingType
		this
	}
	
	override build() {
		val xumlType = mapper.convertType(type)
		return (builder => [
					it.castingType = xumlType
					it.descriptor = descriptor
				]).build
	}
	
	
}