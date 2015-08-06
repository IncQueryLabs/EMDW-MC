package com.incquerylabs.emdw.cpp.common.modelaccess.builder.impl

import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IUmlPropertyReadBuilder
import org.eclipse.uml2.uml.Property
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IOoplAttributeAccessBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IOoplAssociationAccessBuilder

class UmlPropertyAccessBuilder implements IUmlPropertyReadBuilder {
	private UmlToXtumlMapper mapper
	private IOoplAttributeAccessBuilder attributeBuilder
	private IOoplAssociationAccessBuilder associationBuilder
	
	private ValueDescriptor variable
	private Property property
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		attributeBuilder = new CppAttributeAccessBuilder(engine)
	}
	
	
	override build() {
		val xtUmlAttribute = mapper.convertPropertyToAttribute(property)
		if(xtUmlAttribute!=null) {
			return (attributeBuilder => [
						it.variable = variable
						it.attribute = xtUmlAttribute
					]).build
		}
		val xtUmlAssociation = mapper.convertPropertyToAssociation(property)
		return (associationBuilder => [
					it.variable = variable
					it.association = xtUmlAssociation
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
	
}