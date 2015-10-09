package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor

interface IOoplSendSignalBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	def IOoplSendSignalBuilder setVariable(ValueDescriptor variable)
	def IOoplSendSignalBuilder setSignal(ValueDescriptor signal)
	def IOoplSendSignalBuilder setIsInternal(boolean isContextStatic)
}