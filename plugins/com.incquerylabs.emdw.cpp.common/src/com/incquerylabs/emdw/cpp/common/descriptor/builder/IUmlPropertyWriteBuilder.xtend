package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.PropertyWriteDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.uml2.uml.Property
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IValueDescriptorBuilder

interface IUmlPropertyWriteBuilder extends IValueDescriptorBuilder<PropertyWriteDescriptor> {
	
	def IUmlPropertyWriteBuilder setVariable(ValueDescriptor variable)
	
	def IUmlPropertyWriteBuilder setProperty(Property property)
	
	def IUmlPropertyWriteBuilder setNewValue(ValueDescriptor newValue)
}