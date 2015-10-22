package com.incquerylabs.uml.ralf.tests.util.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlConstructorCallBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import java.util.List
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.Type
import com.incquerylabs.emdw.cpp.common.util.UmlTypedValueDescriptor

class DummyConstructorCallBuilder implements IUmlConstructorCallBuilder{
	Type type
	List<UmlTypedValueDescriptor<? extends ValueDescriptor>> params
	Operation operation
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	override build() {
		val parameters = '''«FOR i : params SEPARATOR ", "»«i.descriptor.stringRepresentation»«ENDFOR»'''
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
	
	
	override setParameters(UmlTypedValueDescriptor<? extends ValueDescriptor>... params) {
		this.params = params
		this
	}
	
	override setOperation(Operation operation) {
		this.operation = operation
		this
	}
	
}