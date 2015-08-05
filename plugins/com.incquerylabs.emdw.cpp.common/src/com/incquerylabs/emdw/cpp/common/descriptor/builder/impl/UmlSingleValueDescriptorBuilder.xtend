package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSingleValueDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import org.eclipse.uml2.uml.Type

import static com.google.common.base.Preconditions.*

class UmlSingleValueDescriptorBuilder implements IUmlSingleValueDescriptorBuilder {
	private String name
	private String literal
	private Type type
	private boolean isExistingVariable
	private UmlValueDescriptorFactory factory
	
	new(UmlValueDescriptorFactory factory) {
		this.factory = factory
	}
	
	override build() {
		checkArgument(type!=null, "Type cannot be null")
		// TODO: business logic
		if(isExistingVariable) {
			return factory.prepareSingleValueDescriptorForExistingVariable(type, name)
		} else if(literal!=null) {
			return factory.prepareSingleValueDescriptorForLiteral(type, literal)
		} else if(name!=null) {
			return factory.prepareSingleValueDescriptorForNewLocalVariable(type, name)
		} else {
			return factory.prepareSingleValueDescriptorForNewLocalVariable(type)
		}
	}
	
	override IUmlSingleValueDescriptorBuilder setName(String name) {
		this.name = name
		this.literal = null
		return this
	}
	
	override IUmlSingleValueDescriptorBuilder setLiteral(String literal) {
		this.literal = literal
		this.name = null
		return this
	}
	
	override IUmlSingleValueDescriptorBuilder setType(Type type) {
		this.type = type
		return this
	}
	
	override IUmlSingleValueDescriptorBuilder setIsExistingVariable(boolean isExistingVariable) {
		this.isExistingVariable = isExistingVariable
		return this
	}
	
}