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

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.util.UmlTypedValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import java.util.List
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.Type

class DummyCollectionOperationCallBuilder implements IUmlCollectionOperationCallBuilder {
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	ValueDescriptor variable
	Operation operation	
	List<UmlTypedValueDescriptor<? extends ValueDescriptor>> params
	Type elementType
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		this
	}
	
	override setOperation(Operation operation) {
		this.operation = operation
		this
	}
	
	override setParameters(UmlTypedValueDescriptor<? extends ValueDescriptor>... params) {
		this.params = params
		this
	}
	
	override setCollectionElementType(Type elementType) {
		this.elementType = elementType
		this
	}
	
	override build() {
		var parameters = ""
		for(desc : params.map[descriptor]){
			parameters+=desc.stringRepresentation
			if(params.indexOf(desc)!=(params.size-1)){
				parameters+=''', '''	
			}
		}
		val tuple = parameters
		val descriptor = createOperationCallDescriptor => [
			if(operation.type == null){
				baseType = "void"
				fullType = "void"
			}else{
				baseType = operation.type.qualifiedName
				fullType = operation.type.qualifiedName
			}
			stringRepresentation = variable.stringRepresentation+'''.'''+operation.name+'''('''+tuple+''')'''
		]
		
		descriptor
	}
	
}