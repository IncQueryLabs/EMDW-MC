package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionVariableDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import org.eclipse.uml2.uml.Type

import static com.google.common.base.Preconditions.*

class UmlCollectionVariableDescriptorBuilder implements IUmlCollectionVariableDescriptorBuilder {
	private String name
	private Type collectionType
	private Type elementType
	private boolean isExistingVariable
	private UmlValueDescriptorFactory factory
	
	new(UmlValueDescriptorFactory factory) {
		this.factory = factory
	}
	
	override build() {
		checkArgument(collectionType!=null, "Collection type cannot be null")
		checkArgument(elementType!=null, "Element type cannot be null")
		if(isExistingVariable) {
			return factory.prepareCollectionVariableDescriptorForExistingVariable(collectionType, elementType, name)
		} else if(name!=null) {
			return factory.prepareCollectionVariableDescriptorForNewLocalVariable(collectionType, elementType, name)
		} else {
			return factory.prepareCollectionVariableDescriptorForNewLocalVariable(collectionType, elementType)
		}
	}
	
	override IUmlCollectionVariableDescriptorBuilder setName(String name) {
		this.name = name
		return this
	}
	
	override IUmlCollectionVariableDescriptorBuilder setCollectionType(Type collectionType) {
		this.collectionType = collectionType
		return this
	}
	
	override IUmlCollectionVariableDescriptorBuilder setElementType(Type elementType) {
		this.elementType = elementType
		return this
	}
	
	override IUmlCollectionVariableDescriptorBuilder setIsExistingVariable(boolean isExistingVariable) {
		this.isExistingVariable = isExistingVariable
		return this
	}
	
}