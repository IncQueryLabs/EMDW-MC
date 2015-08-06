package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionVariableDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory

class UmlCollectionVariableDescriptorBuilder implements IUmlCollectionVariableDescriptorBuilder {
	private UmlValueDescriptorFactory factory
	
	new(UmlValueDescriptorFactory factory) {
		this.factory = factory
	}
	
	override build() {
		// TODO
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}