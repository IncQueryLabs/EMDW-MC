package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor

interface IUmlSendSignalBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	def IUmlSendSignalBuilder setVariable(ValueDescriptor variable)
	def IUmlSendSignalBuilder setSignal(ValueDescriptor signal)
	def IUmlSendSignalBuilder setIsInternal(boolean isContextStatic)
}