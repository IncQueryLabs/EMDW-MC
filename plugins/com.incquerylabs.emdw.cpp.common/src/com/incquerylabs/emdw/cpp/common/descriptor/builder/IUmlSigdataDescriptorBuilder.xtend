package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor
import org.eclipse.uml2.uml.Type

interface IUmlSigdataDescriptorBuilder  extends IValueDescriptorBuilder<SingleVariableDescriptor>{
	/**
	 * Sets the type for the future built
	 * {@link SingleVariableDescriptor <em>SingleVariableDescriptor</em>}'s 
	 * {@link SingleVariableDescriptor#getValueType <em>valueType</em>}.
	 * 
	 * @param type Cannot be null
	 */
	def IUmlSigdataDescriptorBuilder setType(Type type)
}