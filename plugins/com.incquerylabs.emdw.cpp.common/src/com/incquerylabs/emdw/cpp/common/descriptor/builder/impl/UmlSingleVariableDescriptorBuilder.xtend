package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSingleVariableDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import org.apache.log4j.Logger
import org.eclipse.uml2.uml.Type

import static com.google.common.base.Preconditions.*
import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor

class UmlSingleVariableDescriptorBuilder implements IUmlSingleVariableDescriptorBuilder {
	extension Logger logger = Logger.getLogger(class)
	
	private String name
	private Type type
	boolean initialize
	private boolean isExistingVariable
	private UmlValueDescriptorFactory factory
	
	new(UmlValueDescriptorFactory factory) {
		this.factory = factory
	}
	
	override build() {
		checkArgument(type!=null, "Type cannot be null")
		trace('''Started building''')
		var SingleVariableDescriptor svd = null
		if(isExistingVariable) {
			svd = factory.prepareSingleVariableDescriptorForExistingVariable(type, name)
		} else if(name!=null) {
			svd = factory.prepareSingleVariableDescriptorForNewLocalVariable(type, name, initialize)
		} else {
			 svd = factory.prepareSingleVariableDescriptorForNewLocalVariable(type, initialize)
		}
		trace('''Finished building''')
		return svd
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
	
	override setInitialize(boolean initialize) {
		this.initialize = initialize
		return this
	}
	
}