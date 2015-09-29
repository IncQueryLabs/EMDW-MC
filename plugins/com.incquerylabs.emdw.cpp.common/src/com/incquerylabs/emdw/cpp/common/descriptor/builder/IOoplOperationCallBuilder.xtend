package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.papyrusrt.xtumlrt.common.Operation

interface IOoplOperationCallBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	
	def IOoplOperationCallBuilder setVariable(ValueDescriptor variable)
	
	def IOoplOperationCallBuilder setOperation(Operation operation)
	
	def IOoplOperationCallBuilder setOperationName(String operationName)
	
	def IOoplOperationCallBuilder setCollectionType(String collectionType)
	
	def IOoplOperationCallBuilder setParameters(ValueDescriptor... params)
	
}