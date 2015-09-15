package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass

interface IOoplInstancesBuilder extends IValueDescriptorBuilder<CollectionVariableDescriptor> {
	def IOoplInstancesBuilder setOoplClass(XTClass xtClass)
}