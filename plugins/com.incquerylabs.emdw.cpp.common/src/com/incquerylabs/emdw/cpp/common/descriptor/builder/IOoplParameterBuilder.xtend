package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.ParameterDescriptor
import org.eclipse.papyrusrt.xtumlrt.common.Parameter

interface IOoplParameterBuilder extends IValueDescriptorBuilder<ParameterDescriptor> {
	
	def IOoplParameterBuilder setParameter(Parameter parameter)
	 
}