package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IValueDescriptorBuilder
import com.incquerylabs.emdw.valuedescriptor.PropertyReadDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.uml2.uml.Property

interface IUmlPropertyReadBuilder extends IValueDescriptorBuilder<PropertyReadDescriptor> {
	
	def IUmlPropertyReadBuilder setVariable(ValueDescriptor variable)
	
	def IUmlPropertyReadBuilder setProperty(Property property)
}