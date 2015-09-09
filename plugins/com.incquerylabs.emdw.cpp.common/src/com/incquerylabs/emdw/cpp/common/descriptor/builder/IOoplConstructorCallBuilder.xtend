package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass

interface IOoplConstructorCallBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	
	def IOoplConstructorCallBuilder setXtClass(XTClass cl)
	
	def IOoplConstructorCallBuilder setParameters(ValueDescriptor... params)
	
}