package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.Type

interface IUmlConstructorCallBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	
	def IUmlConstructorCallBuilder setType(Type type)
	
	def IUmlConstructorCallBuilder setOperation(Operation operation)
	
	def IUmlConstructorCallBuilder setParameters(Pair<Type, ? extends ValueDescriptor>... params)
}