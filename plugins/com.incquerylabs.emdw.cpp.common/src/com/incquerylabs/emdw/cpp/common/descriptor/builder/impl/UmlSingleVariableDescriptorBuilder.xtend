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
package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSingleVariableDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import org.apache.log4j.Logger
import org.eclipse.uml2.uml.Type

import static com.google.common.base.Preconditions.*
import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor

class UmlSingleVariableDescriptorBuilder implements IUmlSingleVariableDescriptorBuilder {
	extension Logger logger = Logger.getLogger(class)
	
	private String name
	private Type type
	boolean initialize
	private boolean isExistingVariable
	private UmlValueDescriptorFactory factory
	
	new(UmlValueDescriptorFactory factory) {
		this.factory = factory
	}
	
	override build() {
		checkArgument(type!=null, "Type cannot be null")
		trace('''Started building''')
		var SingleVariableDescriptor svd = null
		if(isExistingVariable) {
			svd = factory.prepareSingleVariableDescriptorForExistingVariable(type, name)
		} else if(name!=null) {
			svd = factory.prepareSingleVariableDescriptorForNewLocalVariable(type, name, initialize)
		} else {
			 svd = factory.prepareSingleVariableDescriptorForNewLocalVariable(type, initialize)
		}
		trace('''Finished building''')
		return svd
	}
	
	override IUmlSingleVariableDescriptorBuilder setName(String name) {
		this.name = name
		return this
	}
	
	override IUmlSingleVariableDescriptorBuilder setType(Type type) {
		this.type = type
		return this
	}
	
	override IUmlSingleVariableDescriptorBuilder setIsExistingVariable(boolean isExistingVariable) {
		this.isExistingVariable = isExistingVariable
		return this
	}
	
	override setInitialize(boolean initialize) {
		this.initialize = initialize
		return this
	}
	
}