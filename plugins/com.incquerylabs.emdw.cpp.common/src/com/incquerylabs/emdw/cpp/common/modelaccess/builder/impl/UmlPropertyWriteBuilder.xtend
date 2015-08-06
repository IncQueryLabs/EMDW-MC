package com.incquerylabs.emdw.cpp.common.modelaccess.builder.impl

import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IUmlPropertyWriteBuilder
import org.eclipse.uml2.uml.Property
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IOoplAttributeWriteBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor

class UmlPropertyWriteBuilder implements IUmlPropertyWriteBuilder {
	private UmlToXtumlMapper mapper
	private IOoplAttributeWriteBuilder builder
	
	private ValueDescriptor variable
	private Property property
	private ValueDescriptor newValue
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppAttributeWriteBuilder(engine)
	}
	
	override build() {
		val xtUmlProperty = mapper.convertPropertyToAttribute(property)
		return (builder => [
					it.variable = variable
					it.attribute = xtUmlProperty
					it.newValue = newValue
				]).build
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
	override setProperty(Property property) {
		this.property = property
		return this
	}
	
	override setNewValue(ValueDescriptor newValue) {
		this.newValue = newValue
		return this
	}
	
}