package com.incquerylabs.emdw.cpp.common.modelaccess.builder.impl

import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IUmlPropertyAccessBuilder
import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor
import org.eclipse.uml2.uml.Property
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IOoplAttributeAccessBuilder

class UmlPropertyAccessBuilder implements IUmlPropertyAccessBuilder {
	private UmlToXtumlMapper mapper
	private IOoplAttributeAccessBuilder builder
	
	private SingleValueDescriptor variable
	private Property property
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppAttributeAccessBuilder(engine)
	}
	
	
	override build() {
		val xtUmlProperty = mapper.convertProperty(property)
		return (builder => [
					it.variable = variable
					it.attribute = xtUmlProperty
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
	
}