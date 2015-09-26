package com.incquerylabs.uml.ralf.tests.util.descriptors

import com.google.common.collect.Lists
import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.valuedescriptor.VariableDescriptor
import java.util.List

class DummyUmlValueDescriptorFactory implements IUmlDescriptorFactory{
	public int number = 0;	
	public List<VariableDescriptor> cache;	
			
	new(){
		cache = Lists.newArrayList	
	}
	
	override createChild() {
		return this
	}
	
	override createSingleVariableDescriptorBuilder() {
		val builder = new DummyUmlSingleVariableDescriptorBuilder
		builder.descrFactory = this
	}
	
	override createCollectionVariableDescriptorBuilder() {
		val builder = new DummyUmlCollectionVariableDescriptorBuilder
		builder.descrFactory = this
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
		new DummyCopyConstructorCallBuilder
	}
	
	override createSigdataDescriptorBuilder() {
		new DummySigDataBuilder
	}
	
	override createCollectionLiteralBuilder() {
		new DummyCollectionLiteralDescriptorBuilder
	}
	
	override getCachedVariableDescriptor(String name) {
		(cache.filter[vd | vd.stringRepresentation.equals(name)]).head
	}
	
	override createCastDescriptorBuilder() {
		new DummyCastDescriptorBuilder
	}
	
	override createForeachBuilder() {
		new DummyForeachBuilder
	}
	
	override createParameterDescriptorBuilder() {
		// TODO: implement this!
	}
	
}