package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor
import org.eclipse.uml2.uml.Type

interface IUmlSingleValueDescriptorBuilder  extends IUmlValueDescriptorBuilder<SingleValueDescriptor>{
	/**
	 * Sets the base of the name for the future built 
	 * {@link SingleValueDescriptor <em>SingleValueDescriptor</em>}'s 
	 * {@link SingleValueDescriptor#getStringRepresentation <em>stringRepresentation</em>}.
	 */
	def IUmlSingleValueDescriptorBuilder setName(String name) 
	
	/**
	 * Sets the literal for the future built
	 * {@link SingleValueDescriptor <em>SingleValueDescriptor</em>}'s 
	 * {@link SingleValueDescriptor#getStringRepresentation <em>stringRepresentation</em>}.
	 * If you want to build a descriptor for a literal you should use one of the correct 
	 * PrimitiveTypes.
	 * 
	 * @param literal Cannot be null
	 */
	def IUmlSingleValueDescriptorBuilder setLiteral(String literal) 
	
	/**
	 * Sets the type for the future built
	 * {@link SingleValueDescriptor <em>SingleValueDescriptor</em>}'s 
	 * {@link SingleValueDescriptor#getValueType <em>valueType</em>}.
	 * 
	 * @param type Cannot be null
	 */
	def IUmlSingleValueDescriptorBuilder setType(Type type)
	
	/**
	 * If you want to get a descriptor for name what you defined you should set this true.
	 * The returned SingleValueDescriptor's stringRepresentation will not necessarily the
	 * same as the defined name.
	 */
	def IUmlSingleValueDescriptorBuilder setIsExistingVariable(boolean isExistingVariable) 
}