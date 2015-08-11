package com.incquerylabs.uml.ralf.tests.util

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory

class DummyUmlValueDescriptorFactory implements IUmlDescriptorFactory{
			
	override createChild() {
		return this
	}
	
	override createSingleVariableDescriptorBuilder() {
		return new DummyUmlSingleVariableDescriptorBuilder
	}
	
	override createCollectionVariableDescriptorBuilder() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createPropertyWriteBuilder() {
		new DummyPropertyWriteBuilder
	}
	
	override createOperationCallBuilder() {
		new DummyOperationCallBuilder
	}
	
	override createPropertyReadBuilder() {
		new DummyPropertyAccessBuilder
	}
	
	override createLiteralDescriptorBuilder() {
		new DummyLiteralDescriptorBuilder
	}
	
}