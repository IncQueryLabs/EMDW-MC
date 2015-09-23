package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor

interface IOoplForeachBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	def IOoplForeachBuilder setCollectionDescriptor(ValueDescriptor collection)
	
	def IOoplForeachBuilder setVariableDescriptor(ValueDescriptor variable)
}