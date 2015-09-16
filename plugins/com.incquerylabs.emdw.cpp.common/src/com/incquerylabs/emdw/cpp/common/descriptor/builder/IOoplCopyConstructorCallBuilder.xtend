package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent

interface IOoplCopyConstructorCallBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	
	def IOoplCopyConstructorCallBuilder setEvent(XTClassEvent event)
	
	def IOoplCopyConstructorCallBuilder setParameter(ValueDescriptor param)
	
}