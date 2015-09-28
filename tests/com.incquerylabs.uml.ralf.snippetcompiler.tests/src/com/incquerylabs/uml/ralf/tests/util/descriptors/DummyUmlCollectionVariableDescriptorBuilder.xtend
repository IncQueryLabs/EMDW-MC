package com.incquerylabs.uml.ralf.tests.util.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionVariableDescriptorBuilder
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.Type

import static com.google.common.base.Preconditions.*

class DummyUmlCollectionVariableDescriptorBuilder implements IUmlCollectionVariableDescriptorBuilder{
	private String name
	private Type elementType
	private Type collectionType
	private boolean isExistingVariable
	private DummyUmlValueDescriptorFactory descrFactory
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	override setName(String name) {
		this.name = name
		this
	}
	
	def setDescrFactory(DummyUmlValueDescriptorFactory descrFactory) {
		this.descrFactory = descrFactory
		this
	}
	
	override setIsExistingVariable(boolean isExistingVariable) {
		this.isExistingVariable=isExistingVariable
		this
	}
	
	override build() {
		checkArgument(collectionType!=null, "Type cannot be null")
		checkArgument(elementType!=null, "Type cannot be null")
		if(isExistingVariable) {
			prepareCollectionValueDescriptorForExistingVariable(collectionType, elementType, name)
		} else if(name!=null) {
			val descriptor = prepareCollectionValueDescriptorForNewLocalVariable(collectionType, elementType, name)
			descrFactory.cache.add(descriptor)
			return descriptor
		} else {
			val descriptor = prepareCollectionValueDescriptorForNewLocalVariable(collectionType, elementType)
			descrFactory.cache.add(descriptor)
			return descriptor
		}
	}
	
	def prepareCollectionValueDescriptorForNewLocalVariable(Type collectionType, Type elementType, String localVariableName) {
		val descr = factory.createCollectionVariableDescriptor()
		descr.stringRepresentation = localVariableName
		descr.valueRepresentation = '''value{«descr.stringRepresentation»}'''
		descr.pointerRepresentation = '''pointer{«descr.stringRepresentation»}'''
		if(collectionType != null && elementType != null){
			descr.baseType = '''«collectionType.qualifiedName»<«elementType.qualifiedName»>'''
			descr.fullType = '''«collectionType.qualifiedName»<«elementType.qualifiedName»>'''
			descr.templateTypes.add(elementType.qualifiedName)
		}
		descr
	}
	
	def prepareCollectionValueDescriptorForNewLocalVariable(Type collectionType, Type elementType) {
		val descr = factory.createCollectionVariableDescriptor()
		descr.stringRepresentation = "temp"+descrFactory.number
		descr.valueRepresentation = '''value{«descr.stringRepresentation»}'''
		descr.pointerRepresentation = '''pointer{«descr.stringRepresentation»}'''
		descrFactory.number++
		if(collectionType != null && elementType != null){
			descr.baseType = '''«collectionType.qualifiedName»<«elementType.qualifiedName»>'''
			descr.fullType = '''«collectionType.qualifiedName»<«elementType.qualifiedName»>'''
			descr.templateTypes.add(elementType.qualifiedName)
		}
		descr
	}
	
	def prepareCollectionValueDescriptorForExistingVariable(Type collectionType, Type elementType, String localVariableName) {
		val descr = factory.createCollectionVariableDescriptor()
		descr.stringRepresentation = localVariableName
		descr.valueRepresentation = '''value{«descr.stringRepresentation»}'''
		descr.pointerRepresentation = '''pointer{«descr.stringRepresentation»}'''
		if(collectionType != null && elementType != null){
			descr.baseType = '''«collectionType.qualifiedName»<«elementType.qualifiedName»>'''
			descr.fullType = '''«collectionType.qualifiedName»<«elementType.qualifiedName»>'''
			descr.templateTypes.add(elementType.qualifiedName)
		}
		descr
	}
	
	override setCollectionType(Type collectionType) {
		this.collectionType = collectionType
		this
	}
	
	override setElementType(Type elementType) {
		this.elementType = elementType
		this
	}
	
}
