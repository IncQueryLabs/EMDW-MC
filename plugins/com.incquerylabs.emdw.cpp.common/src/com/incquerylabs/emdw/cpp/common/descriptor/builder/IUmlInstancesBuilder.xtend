package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor
import org.eclipse.uml2.uml.Type

interface IUmlInstancesBuilder extends IValueDescriptorBuilder<CollectionVariableDescriptor> {
	def IUmlInstancesBuilder setUmlClass(Type type)
}