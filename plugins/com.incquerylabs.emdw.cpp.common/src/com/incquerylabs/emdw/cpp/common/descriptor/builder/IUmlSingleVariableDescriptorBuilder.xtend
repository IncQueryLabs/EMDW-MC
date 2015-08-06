package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor
import org.eclipse.uml2.uml.Type

interface IUmlSingleVariableDescriptorBuilder  extends IUmlValueDescriptorBuilder<SingleVariableDescriptor>{
	/**
	 * Sets the base of the name for the future built 
	 * {@link SingleVariableDescriptor <em>SingleVariableDescriptor</em>}'s 
	 * {@link SingleVariableDescriptor#getStringRepresentation <em>stringRepresentation</em>}.
	 */
	def IUmlSingleVariableDescriptorBuilder setName(String name) 
	
	/**
	 * Sets the literal for the future built
	 * {@link SingleVariableDescriptor <em>SingleVariableDescriptor</em>}'s 
	 * {@link SingleVariableDescriptor#getStringRepresentation <em>stringRepresentation</em>}.
	 * If you want to build a descriptor for a literal you should use one of the correct 
	 * PrimitiveTypes.
	 * 
	 * @param literal Cannot be null
	 */
	def IUmlSingleVariableDescriptorBuilder setLiteral(String literal) 
	
	/**
	 * Sets the type for the future built
	 * {@link SingleVariableDescriptor <em>SingleVariableDescriptor</em>}'s 
	 * {@link SingleVariableDescriptor#getValueType <em>valueType</em>}.
	 * 
	 * @param type Cannot be null
	 */
	def IUmlSingleVariableDescriptorBuilder setType(Type type)
	
	/**
	 * If you want to get a descriptor for name what you defined you should set this true.
	 * The returned SingleVariableDescriptor's stringRepresentation will not necessarily the
	 * same as the defined name.
	 */
	def IUmlSingleVariableDescriptorBuilder setIsExistingVariable(boolean isExistingVariable) 
}