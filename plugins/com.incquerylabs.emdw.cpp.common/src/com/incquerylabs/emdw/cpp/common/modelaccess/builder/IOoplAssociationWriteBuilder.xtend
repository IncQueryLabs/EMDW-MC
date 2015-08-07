package com.incquerylabs.emdw.cpp.common.modelaccess.builder

import com.incquerylabs.emdw.valuedescriptor.PropertyWriteDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociation
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IValueDescriptorBuilder

interface IOoplAssociationWriteBuilder extends IValueDescriptorBuilder<PropertyWriteDescriptor> {
	
	def IOoplAssociationWriteBuilder setVariable(ValueDescriptor variable)
	
	def IOoplAssociationWriteBuilder setAssociation(XTAssociation association)
	
	def IOoplAssociationWriteBuilder setNewValue(ValueDescriptor newValue)
	
}