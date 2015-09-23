package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor

interface IUmlForeachBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	def IUmlForeachBuilder setCollectionDescriptor(ValueDescriptor collection)
	
	def IUmlForeachBuilder setVariableDescriptor(ValueDescriptor variable)
}