package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.cpp.common.util.XtTypedValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.papyrusrt.xtumlrt.common.Type

interface IOoplCollectionOperationCallBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	def IOoplCollectionOperationCallBuilder setVariable(ValueDescriptor variable)
	
	def IOoplCollectionOperationCallBuilder setOperationReturnType(Type returnType)
	
	def IOoplCollectionOperationCallBuilder setOperationName(String operationName)
	
	def IOoplCollectionOperationCallBuilder setParameters(XtTypedValueDescriptor<? extends ValueDescriptor>... params)
}