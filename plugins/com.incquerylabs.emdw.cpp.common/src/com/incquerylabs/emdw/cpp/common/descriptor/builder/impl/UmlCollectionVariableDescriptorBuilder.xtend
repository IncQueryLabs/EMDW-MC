package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionVariableDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import org.apache.log4j.Logger
import org.eclipse.uml2.uml.Type

import static com.google.common.base.Preconditions.*
import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor

class UmlCollectionVariableDescriptorBuilder implements IUmlCollectionVariableDescriptorBuilder {
	extension Logger logger = Logger.getLogger(class)
	
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
		trace('''Started building''')
		var CollectionVariableDescriptor cvd = null
		if(isExistingVariable) {
			cvd = factory.prepareCollectionVariableDescriptorForExistingVariable(collectionType, elementType, name)
		} else if(name!=null) {
			cvd = factory.prepareCollectionVariableDescriptorForNewLocalVariable(collectionType, elementType, name)
		} else {
			cvd = factory.prepareCollectionVariableDescriptorForNewLocalVariable(collectionType, elementType)
		}
		trace('''Finished building''')
		return cvd
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