package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor
import org.eclipse.uml2.uml.Type

interface IUmlCollectionVariableDescriptorBuilder extends IValueDescriptorBuilder<CollectionVariableDescriptor> {
	/**
	 * Sets the base of the name for the future built 
	 * {@link SingleVariableDescriptor <em>SingleVariableDescriptor</em>}'s 
	 * {@link SingleVariableDescriptor#getStringRepresentation <em>stringRepresentation</em>}.
	 */
	def IUmlCollectionVariableDescriptorBuilder setName(String name) 
	
	/**
	 * Sets the type for the future built
	 * {@link SingleVariableDescriptor <em>SingleVariableDescriptor</em>}'s 
	 * {@link SingleVariableDescriptor#getValueType <em>valueType</em>}.
	 * 
	 * @param type Cannot be null
	 */
	def IUmlCollectionVariableDescriptorBuilder setCollectionType(Type collectionType)
	
	/**
	 * Sets the type for the future built
	 * {@link SingleVariableDescriptor <em>SingleVariableDescriptor</em>}'s 
	 * {@link SingleVariableDescriptor#getValueType <em>valueType</em>}.
	 * 
	 * @param type Cannot be null
	 */
	def IUmlCollectionVariableDescriptorBuilder setElementType(Type elementType)
	
	/**
	 * If you want to get a descriptor for name what you defined you should set this true.
	 * The returned SingleVariableDescriptor's stringRepresentation will not necessarily the
	 * same as the defined name.
	 */
	def IUmlCollectionVariableDescriptorBuilder setIsExistingVariable(boolean isExistingVariable) 
}