package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.cpp.common.util.UmlTypedValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.Type

interface IUmlCollectionOperationCallBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	
	def IUmlCollectionOperationCallBuilder setVariable(ValueDescriptor variable)
	
	def IUmlCollectionOperationCallBuilder setOperation(Operation operation)
	
	def IUmlCollectionOperationCallBuilder setParameters(UmlTypedValueDescriptor<? extends ValueDescriptor>... params)
	
	def IUmlCollectionOperationCallBuilder setCollectionElementType(Type elementType)
	
}