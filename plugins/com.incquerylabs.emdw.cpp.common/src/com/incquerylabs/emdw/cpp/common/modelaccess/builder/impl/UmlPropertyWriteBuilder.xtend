package com.incquerylabs.emdw.cpp.common.modelaccess.builder.impl

import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IUmlPropertyWriteBuilder
import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor
import org.eclipse.uml2.uml.Property
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IOoplAttributeWriteBuilder

class UmlPropertyWriteBuilder implements IUmlPropertyWriteBuilder {
	private UmlToXtumlMapper mapper
	private IOoplAttributeWriteBuilder builder
	
	private SingleValueDescriptor variable
	private Property property
	private SingleValueDescriptor newValue
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppAttributeWriteBuilder(engine)
	}
	
	override build() {
		val xtUmlProperty = mapper.convertProperty(property)
		return (builder => [
					it.variable = variable
					it.attribute = xtUmlProperty
					it.newValue = newValue
				]).build
	}
	
	override setVariable(SingleValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
	override setProperty(Property property) {
		this.property = property
		return this
	}
	
	override setNewValue(SingleValueDescriptor newValue) {
		this.newValue = newValue
		return this
	}
	
}