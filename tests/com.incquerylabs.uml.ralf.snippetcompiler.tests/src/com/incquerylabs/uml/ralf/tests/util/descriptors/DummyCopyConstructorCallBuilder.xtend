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

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCopyConstructorCallBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.Type

class DummyCopyConstructorCallBuilder implements IUmlCopyConstructorCallBuilder{
	Type type
	ValueDescriptor param
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	override build() {
		val descriptor = createOperationCallDescriptor => [
			baseType = type.qualifiedName
			fullType = type.qualifiedName
			stringRepresentation = '''«fullType».clone(«param.stringRepresentation»)'''
		]
		descriptor
	}
	
	override setType(Type type) {
		this.type = type
		this
	}
	
	
	
	override setParameter(ValueDescriptor param) {
		this.param = param
		this
	}
	
}