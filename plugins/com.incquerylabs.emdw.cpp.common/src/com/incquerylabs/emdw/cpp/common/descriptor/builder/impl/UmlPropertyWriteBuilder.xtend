package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlPropertyWriteBuilder
import org.eclipse.uml2.uml.Property
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplAttributeWriteBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplAssociationWriteBuilder

class UmlPropertyWriteBuilder implements IUmlPropertyWriteBuilder {
	private UmlToXtumlMapper mapper
	private IOoplAttributeWriteBuilder attributeBuilder
	private IOoplAssociationWriteBuilder associationBuilder
	
	private ValueDescriptor variable
	private Property property
	private ValueDescriptor newValue
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		attributeBuilder = new CppAttributeWriteBuilder(engine)
		associationBuilder = new CppAssociationWriteBuilder(engine)
	}
	
	override build() {
		val xtUmlAttribute = mapper.convertPropertyToAttribute(property)
		if(xtUmlAttribute!=null) {
			return (attributeBuilder => [
						it.variable = variable
						it.attribute = xtUmlAttribute
						it.newValue = newValue
					]).build
		}
		val xtUmlAssociation = mapper.convertPropertyToAssociation(property)
		return (associationBuilder => [
					it.variable = variable
					it.association = xtUmlAssociation
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