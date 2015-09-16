package com.incquerylabs.uml.ralf.tests.util.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSigdataDescriptorBuilder
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.Type

class DummySigDataBuilder implements IUmlSigdataDescriptorBuilder {
	Type type
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	override build() {
		val descriptor = createSingleVariableDescriptor => [
			baseType = type.qualifiedName
			stringRepresentation = '''sigdata'''
		]
		descriptor
	}
			
	override setType(Type type) {
		this.type = type
		this
	}
	
}