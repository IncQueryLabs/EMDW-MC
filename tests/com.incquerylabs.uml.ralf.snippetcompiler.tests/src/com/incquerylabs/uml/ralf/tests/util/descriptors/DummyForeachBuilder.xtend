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

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlForeachBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory

class DummyForeachBuilder implements IUmlForeachBuilder{
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	ValueDescriptor collection
	ValueDescriptor variable
	
	override setCollectionDescriptor(ValueDescriptor collection) {
		this.collection = collection
		this
	}
	
	override setVariableDescriptor(ValueDescriptor variable) {
		this.variable = variable
		this
	}
	
	override build() {
		val descriptor = createOperationCallDescriptor => [
			it.baseType = "void"
			it.fullType = "void"
			it.stringRepresentation ='''for(«variable.fullType» «variable.stringRepresentation» : «collection.stringRepresentation»)'''
		]
		
		descriptor
	}
}
