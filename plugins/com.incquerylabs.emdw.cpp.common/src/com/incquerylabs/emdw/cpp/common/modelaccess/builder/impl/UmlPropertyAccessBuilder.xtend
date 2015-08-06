package com.incquerylabs.emdw.cpp.common.modelaccess.builder.impl

import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IUmlPropertyAccessBuilder
import org.eclipse.uml2.uml.Property
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IOoplAttributeAccessBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor

class UmlPropertyAccessBuilder implements IUmlPropertyAccessBuilder {
	private UmlToXtumlMapper mapper
	private IOoplAttributeAccessBuilder builder
	
	private ValueDescriptor variable
	private Property property
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppAttributeAccessBuilder(engine)
	}
	
	
	override build() {
		val xtUmlAttribute = mapper.convertPropertyToAttribute(property)
		if(xtUmlAttribute!=null) {
			return (builder => [
						it.variable = variable
						it.attribute = xtUmlAttribute
					]).build		
		}
		
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