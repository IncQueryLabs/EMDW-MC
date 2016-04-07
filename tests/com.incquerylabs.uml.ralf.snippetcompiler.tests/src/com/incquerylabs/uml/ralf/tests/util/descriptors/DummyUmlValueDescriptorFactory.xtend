/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.uml.ralf.tests.util.descriptors

import com.google.common.collect.Lists
import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List

class DummyUmlValueDescriptorFactory implements IUmlDescriptorFactory{
	public int number = 0;	
	public List<ValueDescriptor> cache;	
			
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
	
	override createParameterDescriptorBuilder() {
		val builder = new DummyParameterBuilder
		builder.descFactory = this
	}
	
	override createPropertyWriteBuilder() {
		new DummyPropertyWriteBuilder
	}
	
	override createOperationCallBuilder() {
		new DummyOperationCallBuilder
	}
	
	override createPropertyReadBuilder() {
		val builder = new DummyPropertyAccessBuilder
		builder.descrFactory = this
	}
	
	override createLiteralDescriptorBuilder() {
		new DummyLiteralDescriptorBuilder
	}
	
	override createConstructorCallBuilder() {
		new DummyConstructorCallBuilder
	}
	
	override createCollectionOperationCallBuilder() {
		new DummyCollectionOperationCallBuilder
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
		val builder = new DummyCollectionLiteralDescriptorBuilder
		builder.descFactory = this
		
	}
	
	override createCastDescriptorBuilder() {
		new DummyCastDescriptorBuilder
	}
	
	override createForeachBuilder() {
		new DummyForeachBuilder
	}
	
	override createEnumerationLiteralDescriptorBuilder() {
		new DummyEnumLiteralBuilder
	}
	
}