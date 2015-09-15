package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor

interface IUmlDeleteBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	def IUmlDeleteBuilder setVariable(ValueDescriptor variable)
}