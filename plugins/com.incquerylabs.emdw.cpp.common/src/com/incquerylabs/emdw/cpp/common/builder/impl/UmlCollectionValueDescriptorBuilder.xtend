package com.incquerylabs.emdw.cpp.common.builder.impl

import com.incquerylabs.emdw.cpp.common.builder.IUmlCollectionValueDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.factory.impl.UmlValueDescriptorFactory

class UmlCollectionValueDescriptorBuilder implements IUmlCollectionValueDescriptorBuilder {
	private UmlValueDescriptorFactory factory
	
	new(UmlValueDescriptorFactory factory) {
		this.factory = factory
	}
	
	override build() {
		// TODO
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}