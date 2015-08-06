package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor

interface IUmlValueDescriptorBuilder<IValueDescriptor extends ValueDescriptor> {
	/**
	 * Build the concrete Descriptor with the previously set parameters.
	 */
	def IValueDescriptor build()
}