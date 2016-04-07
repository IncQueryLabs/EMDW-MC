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

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlLinkUnlinkBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.Association
import org.eclipse.uml2.uml.Property

class DummyLinkUnlinkBuilder implements IUmlLinkUnlinkBuilder {
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	boolean isUnlink
	Association association
	Property sourceProperty
	Property targetProperty
	ValueDescriptor sourceDescriptor
	ValueDescriptor targetDescriptor
	
	override isUnlink(boolean isUnlink) {
		this.isUnlink = isUnlink
		this
	}
	
	override setAssociation(Association association) {
		this.association = association
		this 
	}
	
	override setSourceProperty(Property sourceProperty) {
		this.sourceProperty = sourceProperty
		this
	}
	
	override setSourceDescriptor(ValueDescriptor sourceDescriptor) {
		this.sourceDescriptor = sourceDescriptor
		this
	}
	
	override setTargetProperty(Property targetProperty) {
		this.targetProperty = targetProperty
		this
	}
	
	override setTargetDescriptor(ValueDescriptor targetDescriptor) {
		this.targetDescriptor = targetDescriptor
		this
	}
	
	override build() {
		val descriptor = createOperationCallDescriptor => [
			baseType = "void"
			fullType = "void"
			if(isUnlink){
				stringRepresentation = '''
				«targetDescriptor.stringRepresentation»->«sourceProperty.owningAssociation.name»_«sourceProperty.name» = NULL;
				«sourceDescriptor.stringRepresentation»->«targetProperty.owningAssociation.name»_«targetProperty.name» = NULL'''
			} else {
				stringRepresentation = '''
				«targetDescriptor.stringRepresentation»->«sourceProperty.owningAssociation.name»_«sourceProperty.name» = «sourceDescriptor.stringRepresentation»;
				«sourceDescriptor.stringRepresentation»->«targetProperty.owningAssociation.name»_«targetProperty.name» = «targetDescriptor.stringRepresentation»'''
			}
		]
		return descriptor
	}
	
}