package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.uml2.uml.Type

interface IUmlCopyConstructorCallBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	
	def IUmlCopyConstructorCallBuilder setType(Type type)
	
	def IUmlCopyConstructorCallBuilder setParameter(ValueDescriptor param)
}