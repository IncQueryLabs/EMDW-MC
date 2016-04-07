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

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlEnumerationLiteralDescriptorBuilder
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.EnumerationLiteral

class DummyEnumLiteralBuilder implements IUmlEnumerationLiteralDescriptorBuilder {
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	EnumerationLiteral enumLiteral
	
	override build() {
		val type = enumLiteral.classifier.qualifiedName
		val name = enumLiteral.qualifiedName
		createLiteralDescriptor => [
			it.baseType = type
			it.fullType = type
			it.stringRepresentation = name
			it.valueRepresentation = name
			it.pointerRepresentation = name			
		]
	}
	
	override setEnumerationLiteral(EnumerationLiteral enumLiteral) {
		this.enumLiteral = enumLiteral
		this
	}
	
}