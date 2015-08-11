package com.incquerylabs.uml.ralf.tests.util

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlOperationCallBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import java.util.List
import org.eclipse.uml2.uml.Operation

class DummyOperationCallBuilder implements IUmlOperationCallBuilder{
	ValueDescriptor variable
	Operation operation
	List<ValueDescriptor> params
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	override build() {
		val parameters = ""
		for(ValueDescriptor desc : params){
			parameters.concat(desc.stringRepresentation)
			if(params.indexOf(desc)!=(params.size-1)){
				parameters.concat(''', ''')	
			}
		}
		
		val descriptor = createOperationCallDescriptor => [
			baseType = operation.type.qualifiedName
			fullType = operation.type.qualifiedName
			stringRepresentation = variable.stringRepresentation+'''.'''operation.name+'''('''+parameters+''')'''
		]
		
		descriptor
		
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		this
	}
	
	override setOperation(Operation operation) {
		this.operation = operation
		this
	}
	
	override setParameters(ValueDescriptor... params) {
		this.params = params
		this
	}
	
}