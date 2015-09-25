package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor
import org.eclipse.uml2.uml.Parameter

interface IUmlParameterDescriptorBuilder extends IValueDescriptorBuilder<SingleVariableDescriptor> {
	
	def IUmlParameterDescriptorBuilder setParameter(Parameter parameter)
	
}