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
package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor
import org.eclipse.uml2.uml.Type

interface IUmlSingleVariableDescriptorBuilder  extends IValueDescriptorBuilder<SingleVariableDescriptor>{
	/**
	 * Sets the base of the name for the future built 
	 * {@link SingleVariableDescriptor <em>SingleVariableDescriptor</em>}'s 
	 * {@link SingleVariableDescriptor#getStringRepresentation <em>stringRepresentation</em>}.
	 */
	def IUmlSingleVariableDescriptorBuilder setName(String name) 
	
	/**
	 * Sets the type for the future built
	 * {@link SingleVariableDescriptor <em>SingleVariableDescriptor</em>}'s 
	 * {@link SingleVariableDescriptor#getValueType <em>valueType</em>}.
	 * 
	 * @param type Cannot be null
	 */
	def IUmlSingleVariableDescriptorBuilder setType(Type type)
	
	/**
	 * If you want to get a descriptor for name what you defined you should set this true.
	 * The returned SingleVariableDescriptor's stringRepresentation will not necessarily the
	 * same as the defined name.
	 */
	def IUmlSingleVariableDescriptorBuilder setIsExistingVariable(boolean isExistingVariable)
	
	/**
	 * Determines if the created variable requires default initialization. 
	 */
	def IUmlSingleVariableDescriptorBuilder setInitialize(boolean initialize)
}