package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlLiteralDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import org.eclipse.uml2.uml.Type

import static com.google.common.base.Preconditions.*

class UmlLiteralDescriptorBuilder implements IUmlLiteralDescriptorBuilder {
	private UmlValueDescriptorFactory factory
	
	private Type type
	private String literal
	
	
	
	new(UmlValueDescriptorFactory factory) {
		this.factory = factory
	}
	
	
	
	override setType(Type type) {
		this.type = type
		return this
	}
	
	override setLiteral(String literal) {
		this.literal = literal
		return this
	}
	
	override build() {
		checkArgument(type!=null, "Type cannot be null")
		return factory.prepareSingleVariableDescriptorForLiteral(type, literal)
	}
	
}