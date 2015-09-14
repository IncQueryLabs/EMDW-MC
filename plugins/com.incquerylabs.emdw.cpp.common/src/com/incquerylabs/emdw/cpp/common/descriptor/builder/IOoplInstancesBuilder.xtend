package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor
import com.ericsson.xtumlrt.oopl.OOPLClass

interface IOoplInstancesBuilder extends IValueDescriptorBuilder<CollectionVariableDescriptor> {
	def IOoplInstancesBuilder setOoplClass(OOPLClass cl)
}