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

import com.incquerylabs.emdw.cpp.common.util.UmlTypedValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.Type

interface IUmlCollectionOperationCallBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	
	def IUmlCollectionOperationCallBuilder setVariable(ValueDescriptor variable)
	
	def IUmlCollectionOperationCallBuilder setOperation(Operation operation)
	
	def IUmlCollectionOperationCallBuilder setParameters(UmlTypedValueDescriptor<? extends ValueDescriptor>... params)
	
	def IUmlCollectionOperationCallBuilder setCollectionElementType(Type elementType)
	
}