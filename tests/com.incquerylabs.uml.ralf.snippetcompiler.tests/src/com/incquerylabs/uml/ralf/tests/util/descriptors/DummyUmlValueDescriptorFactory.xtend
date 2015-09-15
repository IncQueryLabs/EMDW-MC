package com.incquerylabs.uml.ralf.tests.util.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory

class DummyUmlValueDescriptorFactory implements IUmlDescriptorFactory{
	public int number = 0;		
			
	override createChild() {
		return this
	}
	
	override createSingleVariableDescriptorBuilder() {
		val builder = new DummyUmlSingleVariableDescriptorBuilder
		builder.descrFactory = this
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
	
	override createConstructorCallBuilder() {
		new DummyConstructorCallBuilder
	}
	
	override createStaticOperationCallBuilder() {
		new DummyStaticOperationCallBuilder
	}
	
	override createInstancesBuilder() {
		new DummyInstancesBuilder
	}
	
	override createLinkUnlinkBuilder() {
		new DummyLinkUnlinkBuilder
	}
	
	override createDeleteBuilder() {
		new DummyDeleteBuilder
	}
	
	override createSendSignalBuilder() {
		new DummySendSignalBuilder
	}
	
	override createCopyConstructorCallBuilder() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createSigdataDescriptorBuilder() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}