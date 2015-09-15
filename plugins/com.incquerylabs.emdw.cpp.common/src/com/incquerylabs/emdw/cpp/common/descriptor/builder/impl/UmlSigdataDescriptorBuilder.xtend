package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSigdataDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import org.eclipse.uml2.uml.Type

import static com.google.common.base.Preconditions.*

class UmlSigdataDescriptorBuilder implements IUmlSigdataDescriptorBuilder {
	private static final String name = "casted_const_event"
	private Type type
	private UmlValueDescriptorFactory factory
	
	new(UmlValueDescriptorFactory factory) {
		this.factory = factory
	}
	
	override build() {
		checkArgument(type!=null, "Type cannot be null")
		return factory.prepareSingleVariableDescriptorForExistingVariable(type, name)
	}
	
	override IUmlSigdataDescriptorBuilder setType(Type type) {
		this.type = type
		return this
	}
}