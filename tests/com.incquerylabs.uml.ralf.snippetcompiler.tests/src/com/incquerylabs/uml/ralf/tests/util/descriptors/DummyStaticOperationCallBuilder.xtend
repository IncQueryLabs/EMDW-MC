package com.incquerylabs.uml.ralf.tests.util.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlStaticOperationCallBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import java.util.List
import org.eclipse.uml2.uml.Operation

class DummyStaticOperationCallBuilder implements IUmlStaticOperationCallBuilder{
	Operation operation
	List<ValueDescriptor> params
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	override build() {
		val parameters = '''«FOR i : params SEPARATOR ", "»«i.stringRepresentation»«ENDFOR»'''
		val descriptor = createOperationCallDescriptor => [
			if(operation.type == null){
				baseType = "void"
				fullType = "void"
			}else{
				baseType = operation.type.qualifiedName
				fullType = operation.type.qualifiedName
			}
			stringRepresentation = operation.qualifiedName+'''('''+parameters+''')'''
		]
		descriptor
	}
	
	override setOperation(Operation operation) {
		this.operation = operation
		this
	}
	
	override setParameters(ValueDescriptor... params) {
		this.params = params.toList
		this
	}
}