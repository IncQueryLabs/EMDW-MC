package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor

interface IOoplOperationCallBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	
	def IOoplOperationCallBuilder setVariable(ValueDescriptor variable)
	
	def IOoplOperationCallBuilder setOperation(Object operation)
	
	def IOoplOperationCallBuilder setParameters(ValueDescriptor... params)
	
}