package com.incquerylabs.uml.ralf.tests.util.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlDeleteBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory

class DummyDeleteBuilder implements IUmlDeleteBuilder{
	ValueDescriptor variable
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	override build() {
		val descriptor = createOperationCallDescriptor => [
			baseType = variable.baseType
			stringRepresentation = '''delete «variable.stringRepresentation»'''
		]
		descriptor
	}
		
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		this
	}
	
}