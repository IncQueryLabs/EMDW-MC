package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.LiteralDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.uml2.uml.Type

interface IUmlCollectionLiteralBuilder extends IValueDescriptorBuilder<LiteralDescriptor> {
	
	def IUmlCollectionLiteralBuilder setCollectionType(Type collectionType)
	
	def IUmlCollectionLiteralBuilder setElementType(Type elementType)
	
	def IUmlCollectionLiteralBuilder setElements(ValueDescriptor... elems)
}