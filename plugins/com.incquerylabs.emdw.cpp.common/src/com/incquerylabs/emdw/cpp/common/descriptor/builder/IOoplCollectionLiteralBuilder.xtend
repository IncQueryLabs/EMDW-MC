package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor
import org.eclipse.papyrusrt.xtumlrt.common.NamedElement
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor

interface IOoplCollectionLiteralBuilder extends IValueDescriptorBuilder<CollectionVariableDescriptor> {
	
	def IOoplCollectionLiteralBuilder setXtCollectionType(String xtCollectionType);
	
	def IOoplCollectionLiteralBuilder setXtElementType(NamedElement xtElementType);
	
	def IOoplCollectionLiteralBuilder setElements(ValueDescriptor... elements);
	
}