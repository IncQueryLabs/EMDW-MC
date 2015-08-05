package com.incquerylabs.emdw.cpp.common.builder.impl

import com.incquerylabs.emdw.cpp.common.builder.IUmlValueDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.valuedescriptor.CollectionValueDescriptor

class UmlCollectionValueDescriptorBuilder implements IUmlValueDescriptorBuilder<CollectionValueDescriptor>{
	private UmlValueDescriptorFactory factory
	
	new(UmlValueDescriptorFactory factory) {
		this.factory = factory
	}
	
	override build() {
		// TODO
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}