package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.PropertyReadDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IValueDescriptorBuilder

interface IOoplAttributeReadBuilder extends IValueDescriptorBuilder<PropertyReadDescriptor> {
	
	def IOoplAttributeReadBuilder setVariable(ValueDescriptor variable)
	
	def IOoplAttributeReadBuilder setAttribute(Attribute attribute)
	
}