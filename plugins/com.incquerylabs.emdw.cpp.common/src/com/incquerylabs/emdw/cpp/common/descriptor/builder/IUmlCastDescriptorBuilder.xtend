package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.VariableDescriptor
import org.eclipse.uml2.uml.Type

interface IUmlCastDescriptorBuilder  extends IValueDescriptorBuilder<VariableDescriptor> {
	def IUmlCastDescriptorBuilder setDescriptor(ValueDescriptor castableDescriptor) 
	
	def IUmlCastDescriptorBuilder setCastingType(Type castingType)
}