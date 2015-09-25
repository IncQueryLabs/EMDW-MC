package com.incquerylabs.emdw.cpp.common.descriptor.builder

import org.eclipse.papyrusrt.xtumlrt.common.Parameter
import com.incquerylabs.emdw.valuedescriptor.VariableDescriptor

interface IOoplParameterBuilder extends IValueDescriptorBuilder<VariableDescriptor> {
	
	def IOoplParameterBuilder setParameter(Parameter parameter)
	 
}