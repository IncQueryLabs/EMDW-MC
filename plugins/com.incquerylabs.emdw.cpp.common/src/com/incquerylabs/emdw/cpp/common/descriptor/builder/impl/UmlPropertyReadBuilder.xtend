package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplAssociationReadBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplAttributeReadBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlPropertyReadBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.valuedescriptor.PropertyReadDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Property

class UmlPropertyReadBuilder implements IUmlPropertyReadBuilder {
	private UmlToXtumlMapper mapper
	private IOoplAttributeReadBuilder attributeBuilder
	private IOoplAssociationReadBuilder associationBuilder
	private UmlValueDescriptorFactory factory
	
	private ValueDescriptor variable
	private Property property
	
	
	new(UmlValueDescriptorFactory factory, AdvancedIncQueryEngine engine) {
		this.factory = factory
		mapper = new UmlToXtumlMapper(engine)
		attributeBuilder = new CppAttributeReadBuilder(engine)
		associationBuilder = new CppAssociationReadBuilder(engine)
	}
	
	
	override build() {
		var PropertyReadDescriptor descriptor
		val xtUmlAttribute = mapper.convertPropertyToAttribute(property)
		if(xtUmlAttribute!=null) {
			descriptor = (attributeBuilder => [
						it.variable = variable
						it.attribute = xtUmlAttribute
					]).build
		} else {
			val xtUmlAssociation = mapper.convertPropertyToAssociation(property)
			descriptor = (associationBuilder => [
						it.variable = variable
						it.association = xtUmlAssociation
					]).build
		}
		factory.putPropertyReadIntoCache(descriptor.stringRepresentation, descriptor)
		return descriptor
		
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
	override setProperty(Property property) {
		this.property = property
		return this
	}
	
}