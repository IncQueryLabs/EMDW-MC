package com.incquerylabs.emdw.cpp.common.modelaccess.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IValueDescriptorBuilder

interface IOoplOperationCallBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	
	def IOoplOperationCallBuilder setVariable(ValueDescriptor variable)
	
	def IOoplOperationCallBuilder setOperation(Operation operation)
	
	def IOoplOperationCallBuilder setParameters(ValueDescriptor... params)
	
}