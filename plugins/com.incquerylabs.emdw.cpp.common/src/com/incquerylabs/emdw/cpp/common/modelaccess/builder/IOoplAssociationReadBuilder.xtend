package com.incquerylabs.emdw.cpp.common.modelaccess.builder

import com.incquerylabs.emdw.valuedescriptor.PropertyReadDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociation
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IValueDescriptorBuilder

interface IOoplAssociationReadBuilder extends IValueDescriptorBuilder<PropertyReadDescriptor> {
	
	def IOoplAssociationReadBuilder setVariable(ValueDescriptor variable)
	
	def IOoplAssociationReadBuilder setAssociation(XTAssociation association)
	
}