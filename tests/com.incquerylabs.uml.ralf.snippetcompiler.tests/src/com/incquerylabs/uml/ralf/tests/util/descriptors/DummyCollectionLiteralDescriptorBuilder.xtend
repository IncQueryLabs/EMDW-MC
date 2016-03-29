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

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionLiteralBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import java.util.List
import org.eclipse.uml2.uml.Type

class DummyCollectionLiteralDescriptorBuilder implements IUmlCollectionLiteralBuilder{
	private Type collectionType
	private Type elementType
	private List<ValueDescriptor> elements
	DummyUmlValueDescriptorFactory descFactory
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	override build() {
		val descr = factory.createCollectionVariableDescriptor()
		descr.stringRepresentation = '''«collectionType.qualifiedName»<«elementType.qualifiedName»> {«FOR d : elements SEPARATOR ', '»«d.stringRepresentation»«ENDFOR» }'''
		if(collectionType != null && elementType !=null){
			descr.baseType = collectionType.qualifiedName
			descr.fullType = '''«collectionType.qualifiedName»<«elementType.qualifiedName»>'''
		}
		descFactory.cache.add(descr)
		descr
	}
	
	override setCollectionType(Type collectionType) {
		this.collectionType = collectionType
		this
	}
	
	override setElementType(Type elementType) {
		this.elementType = elementType
		this
	}
	
	override setElements(ValueDescriptor... elems) {
		this.elements = elems.toList
		this
	}
	
	def setDescFactory(DummyUmlValueDescriptorFactory descFactory) {
		this.descFactory = descFactory
		this
	}
	
}