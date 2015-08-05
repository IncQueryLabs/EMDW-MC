package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.AbstractValueDescriptor

interface IUmlValueDescriptorBuilder<ValueDescriptor extends AbstractValueDescriptor> {
	/**
	 * Build the concrete Descriptor with the previously set parameters.
	 */
	def ValueDescriptor build()
}