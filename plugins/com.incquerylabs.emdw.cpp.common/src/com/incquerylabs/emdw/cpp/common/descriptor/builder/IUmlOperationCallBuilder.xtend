package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.uml2.uml.Operation
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IValueDescriptorBuilder

interface IUmlOperationCallBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	
	def IUmlOperationCallBuilder setVariable(ValueDescriptor variable)
	
	def IUmlOperationCallBuilder setOperation(Operation operation)
	
	def IUmlOperationCallBuilder setParameters(ValueDescriptor... params)
	
}