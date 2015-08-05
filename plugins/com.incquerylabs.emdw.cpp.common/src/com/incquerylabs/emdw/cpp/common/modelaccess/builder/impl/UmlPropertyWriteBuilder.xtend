package com.incquerylabs.emdw.cpp.common.modelaccess.builder.impl

import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IUmlPropertyWriteBuilder
import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor
import org.eclipse.uml2.uml.Property
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine

class UmlPropertyWriteBuilder implements IUmlPropertyWriteBuilder {
	private SingleValueDescriptor variable
	private Property property
	private SingleValueDescriptor newValue
	private UmlToXtumlMapper mapper
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
	}
	
	override build() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
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