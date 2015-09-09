package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.uml2.uml.Operation

interface IUmlStaticOperationCallBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	
	def IUmlStaticOperationCallBuilder setOperation(Operation operation)
	
	def IUmlStaticOperationCallBuilder setParameters(ValueDescriptor... params)
	
}