package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.Map
import org.eclipse.uml2.uml.Operation

interface IUmlStaticOperationCallBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	
	def IUmlOperationCallBuilder setOperation(Operation operation)
	
	def IUmlOperationCallBuilder setParameters(ValueDescriptor... params)
	
	def IUmlOperationCallBuilder setParameters(Map<String, ValueDescriptor> params)
	
}