package com.incquerylabs.uml.ralf.tests.util.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlConstructorCallBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import java.util.List
import org.eclipse.uml2.uml.Type
import org.eclipse.uml2.uml.Operation

class DummyConstructorCallBuilder implements IUmlConstructorCallBuilder{
	Type type
	List<Pair<Type, ? extends ValueDescriptor>> params
	Operation operation
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	override build() {
		val parameters = '''«FOR i : params SEPARATOR ", "»«i.value.stringRepresentation»«ENDFOR»'''
		val descriptor = createOperationCallDescriptor => [
			baseType = type.qualifiedName
			fullType = type.qualifiedName
			stringRepresentation = '''new '''+type.qualifiedName+'''('''+parameters+''')'''
		]
		descriptor
	}
	
	override setType(Type type) {
		this.type = type
		this
	}
	
	
	override setParameters(Pair<Type, ? extends ValueDescriptor>... params) {
		this.params = params.toList
		this
	}
	
	override setOperation(Operation operation) {
		this.operation = operation
		this
	}
	
}