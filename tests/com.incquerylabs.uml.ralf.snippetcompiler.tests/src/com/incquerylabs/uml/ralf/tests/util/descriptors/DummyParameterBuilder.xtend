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

import com.google.common.base.Preconditions
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlParameterDescriptorBuilder
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.Parameter

class DummyParameterBuilder implements IUmlParameterDescriptorBuilder {
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	Parameter parameter
	DummyUmlValueDescriptorFactory descFactory
	
	override setParameter(Parameter parameter) {
		this.parameter = parameter
		this
	}
	
	def setDescFactory(DummyUmlValueDescriptorFactory descFactory) {
		this.descFactory = descFactory
		this
	}
	
	override build() {
		Preconditions.checkArgument(parameter != null, "Parameter cannot be null.")
		
		val desc = factory.createParameterDescriptor => [
			it.stringRepresentation = parameter.name
			it.valueRepresentation = '''value{«it.stringRepresentation»}'''
			it.pointerRepresentation = '''pointer{«it.stringRepresentation»}'''
			it.baseType = parameter.type.qualifiedName
			it.fullType= parameter.type.qualifiedName
		]
		descFactory.cache.add(desc)
		desc
	}
	
}