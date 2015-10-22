package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.cpp.common.util.XtTypedValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.papyrusrt.xtumlrt.common.Operation

interface IOoplStaticOperationCallBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	
	def IOoplStaticOperationCallBuilder setOperation(Operation operation)
	
	def IOoplStaticOperationCallBuilder setOperationName(String operationName)
	
	def IOoplStaticOperationCallBuilder setParameters(XtTypedValueDescriptor<? extends ValueDescriptor>... params)
	
}