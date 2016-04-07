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

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSingleVariableDescriptorBuilder
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.Type

import static com.google.common.base.Preconditions.*

class DummyUmlSingleVariableDescriptorBuilder implements IUmlSingleVariableDescriptorBuilder{
	private String name
	private Type type
	private boolean initialize
	private boolean isExistingVariable
	private DummyUmlValueDescriptorFactory descrFactory
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	override setName(String name) {
		this.name = name
		this
	}
		
	override setType(Type type) {
		this.type=type
		this
	}
	
	def setDescrFactory(DummyUmlValueDescriptorFactory descrFactory) {
		this.descrFactory = descrFactory
		this
	}
	
	override setIsExistingVariable(boolean isExistingVariable) {
		this.isExistingVariable=isExistingVariable
		this
	}
	
	override build() {
		checkArgument(type!=null, "Type cannot be null")
		if(isExistingVariable) {
			val descriptor = prepareSingleValueDescriptorForExistingVariable(type, name)
			descrFactory.cache.add(descriptor)
			return descriptor
		} else if(name!=null) {
			val descriptor = prepareSingleValueDescriptorForNewLocalVariable(type, name, initialize)
			descrFactory.cache.add(descriptor)
			return descriptor
		} else {
			val descriptor = prepareSingleValueDescriptorForNewLocalVariable(type, initialize)
			descrFactory.cache.add(descriptor)
			return descriptor
		}
	}
	
	def prepareSingleValueDescriptorForNewLocalVariable(Type type, String localVariableName, boolean initialize) {
		val descr = factory.createSingleVariableDescriptor()
		if(initialize) {
			descr.stringRepresentation = '''«localVariableName» = default'''
		} else {
			descr.stringRepresentation = localVariableName
		}
		descr.valueRepresentation = '''value{«descr.stringRepresentation»}'''
		descr.pointerRepresentation = '''pointer{«descr.stringRepresentation»}'''
		if(type != null){
			descr.baseType = type.qualifiedName
			descr.fullType = type.qualifiedName
		}
		descr
	}
	
	def prepareSingleValueDescriptorForNewLocalVariable(Type type, boolean initialize) {
		val descr = factory.createSingleVariableDescriptor()
		if(initialize) {
			descr.stringRepresentation = '''temp«descrFactory.number» = default'''
		} else {
			descr.stringRepresentation = '''temp«descrFactory.number»'''
		}
		descr.valueRepresentation = '''value{«descr.stringRepresentation»}'''
		descr.pointerRepresentation = '''pointer{«descr.stringRepresentation»}'''
		descrFactory.number++
		if(type != null){
			descr.baseType = type.qualifiedName
			descr.fullType = type.qualifiedName
		}
		descr
	}
	
	def prepareSingleValueDescriptorForExistingVariable(Type type, String localVariableName) {
		val descr = factory.createSingleVariableDescriptor()
		descr.stringRepresentation = localVariableName
		descr.valueRepresentation = '''value{«descr.stringRepresentation»}'''
		descr.pointerRepresentation = '''pointer{«descr.stringRepresentation»}'''
		if(type != null){
			descr.baseType = type.qualifiedName
			descr.fullType = type.qualifiedName
		}
		descr
	}
	
	override setInitialize(boolean initialize) {
		this.initialize = initialize
		return this
	}
	
}