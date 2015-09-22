package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.VariableDescriptor
import org.eclipse.uml2.uml.Type

interface IUmlCastDescriptorBuilder  extends IValueDescriptorBuilder<VariableDescriptor>{
	/**
	 * Sets the base of the name for the future built 
	 * {@link SingleVariableDescriptor <em>SingleVariableDescriptor</em>}'s 
	 * {@link SingleVariableDescriptor#getStringRepresentation <em>stringRepresentation</em>}.
	 */
	def IUmlCastDescriptorBuilder setDescriptor(ValueDescriptor castableDEscriptor) 
	
	/**
	 * Sets the type for the future built
	 * {@link SingleVariableDescriptor <em>SingleVariableDescriptor</em>}'s 
	 * {@link SingleVariableDescriptor#getValueType <em>valueType</em>}.
	 * 
	 * @param type Cannot be null
	 */
	def IUmlCastDescriptorBuilder setCastingType(Type castingType)
}