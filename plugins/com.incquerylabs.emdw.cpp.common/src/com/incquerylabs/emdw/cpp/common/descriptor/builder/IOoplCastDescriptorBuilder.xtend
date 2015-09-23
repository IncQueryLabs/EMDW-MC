package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.VariableDescriptor
import org.eclipse.papyrusrt.xtumlrt.common.Type

interface IOoplCastDescriptorBuilder  extends IValueDescriptorBuilder<VariableDescriptor> {
	def IOoplCastDescriptorBuilder setDescriptor(ValueDescriptor castableDescriptor) 
	
	def IOoplCastDescriptorBuilder setCastingType(Type castingType)
}