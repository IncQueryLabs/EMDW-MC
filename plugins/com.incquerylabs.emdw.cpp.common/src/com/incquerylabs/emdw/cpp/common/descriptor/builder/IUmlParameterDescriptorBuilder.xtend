package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.ParameterDescriptor
import org.eclipse.uml2.uml.Parameter

interface IUmlParameterDescriptorBuilder extends IValueDescriptorBuilder<ParameterDescriptor> {
	
	def IUmlParameterDescriptorBuilder setParameter(Parameter parameter)
	
}