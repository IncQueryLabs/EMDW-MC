package com.incquerylabs.uml.ralf.tests.util

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory

class DummyUmlValueDescriptorFactory implements IUmlDescriptorFactory{
			
	override createChild() {
		return this
	}
	
	override createSingleValueDescriptorBuilder() {
		return new DummyUmlSingleValueDescriptorBuilder
	}
	
	override createCollectionValueDescriptorBuilder() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}