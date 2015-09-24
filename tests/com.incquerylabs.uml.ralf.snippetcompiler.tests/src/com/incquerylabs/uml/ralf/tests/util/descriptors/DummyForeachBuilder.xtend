package com.incquerylabs.uml.ralf.tests.util.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlForeachBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory

class DummyForeachBuilder implements IUmlForeachBuilder{
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	ValueDescriptor collection
	ValueDescriptor variable
	
	override setCollectionDescriptor(ValueDescriptor collection) {
		this.collection = collection
		this
	}
	
	override setVariableDescriptor(ValueDescriptor variable) {
		this.variable = variable
		this
	}
	
	override build() {
		val descriptor = createOperationCallDescriptor => [
			it.baseType = "void"
			it.fullType = "void"
			it.stringRepresentation ='''for(«variable.fullType» «variable.stringRepresentation» : «collection.stringRepresentation»)'''
		]
		
		descriptor
	}
}
