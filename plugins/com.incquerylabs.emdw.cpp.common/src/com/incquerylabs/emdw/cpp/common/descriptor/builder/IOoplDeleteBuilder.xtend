package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor

interface IOoplDeleteBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	def IOoplDeleteBuilder setVariable(ValueDescriptor variable)
}