package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.cpp.common.util.XtTypedValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import org.eclipse.papyrusrt.xtumlrt.common.RedefinableElement

interface IOoplConstructorCallBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	
	def IOoplConstructorCallBuilder setRedefinableElement(RedefinableElement re)
	
	def IOoplConstructorCallBuilder setOperation(Operation cppOperation)
	
	def IOoplConstructorCallBuilder setParameters(XtTypedValueDescriptor<? extends ValueDescriptor>... params)
	
}