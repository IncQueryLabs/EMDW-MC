package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import org.eclipse.uml2.uml.Type

interface IUmlCollectionConstructorCallBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	
	def IUmlCollectionConstructorCallBuilder setCollectionType(Type collectionType)
	
	def IUmlCollectionConstructorCallBuilder setElementType(Type elementType)
}