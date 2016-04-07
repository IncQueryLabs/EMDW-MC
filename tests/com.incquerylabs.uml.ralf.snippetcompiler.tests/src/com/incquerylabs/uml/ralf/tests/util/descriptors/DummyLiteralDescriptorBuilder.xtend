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

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlLiteralDescriptorBuilder
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.Type

class DummyLiteralDescriptorBuilder implements IUmlLiteralDescriptorBuilder{
	private String literal
	private Type type
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE

	override setType(Type type) {
		this.type=type
		this
	}
	
	override setLiteral(String literal) {
		this.literal=literal
		this
	}
	
	override build() {
		val descr = factory.createLiteralDescriptor()
		descr.stringRepresentation = literal
		descr.valueRepresentation = '''value{«descr.stringRepresentation»}'''
		descr.pointerRepresentation = '''pointer{«descr.stringRepresentation»}'''
		if(type != null){
			descr.baseType = type.qualifiedName
			descr.fullType = type.qualifiedName
		}
		descr
	}
	
}