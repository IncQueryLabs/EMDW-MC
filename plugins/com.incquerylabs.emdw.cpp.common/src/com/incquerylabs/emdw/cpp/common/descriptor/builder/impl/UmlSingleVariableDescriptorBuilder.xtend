package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSingleVariableDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import org.eclipse.uml2.uml.Type

import static com.google.common.base.Preconditions.*

class UmlSingleVariableDescriptorBuilder implements IUmlSingleVariableDescriptorBuilder {
	private String name
	private Type type
	private boolean isExistingVariable
	private UmlValueDescriptorFactory factory
	
	new(UmlValueDescriptorFactory factory) {
		this.factory = factory
	}
	
	override build() {
		checkArgument(type!=null, "Type cannot be null")
		if(isExistingVariable) {
			return factory.prepareSingleVariableDescriptorForExistingVariable(type, name)
		} else if(name!=null) {
			return factory.prepareSingleVariableDescriptorForNewLocalVariable(type, name)
		} else {
			return factory.prepareSingleVariableDescriptorForNewLocalVariable(type)
		}
	}
	
	override IUmlSingleVariableDescriptorBuilder setName(String name) {
		this.name = name
		return this
	}
	
	override IUmlSingleVariableDescriptorBuilder setType(Type type) {
		this.type = type
		return this
	}
	
	override IUmlSingleVariableDescriptorBuilder setIsExistingVariable(boolean isExistingVariable) {
		this.isExistingVariable = isExistingVariable
		return this
	}
	
}