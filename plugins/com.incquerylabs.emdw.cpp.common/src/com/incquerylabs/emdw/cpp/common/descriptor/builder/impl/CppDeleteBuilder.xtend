package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplDeleteBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory

class CppDeleteBuilder implements IOoplDeleteBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	ValueDescriptor variable
	
	override build() {
		return factory.createOperationCallDescriptor => [
					it.baseType = "void"
					it.fullType = "void"
					it.stringRepresentation = '''delete «variable.stringRepresentation»'''
				]
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
}