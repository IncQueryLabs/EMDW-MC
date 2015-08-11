package com.incquerylabs.uml.ralf.tests.util

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSingleVariableDescriptorBuilder
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.Type

import static com.google.common.base.Preconditions.*

class DummyUmlSingleVariableDescriptorBuilder implements IUmlSingleVariableDescriptorBuilder{
	private String name
	private Type type
	private boolean isExistingVariable
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	override setName(String name) {
		this.name = name
		this
	}
		
	override setType(Type type) {
		this.type=type
		this
	}
	
	override setIsExistingVariable(boolean isExistingVariable) {
		this.isExistingVariable=isExistingVariable
		this
	}
	
	override build() {
		checkArgument(type!=null, "Type cannot be null")
		if(isExistingVariable) {
			return prepareSingleValueDescriptorForExistingVariable(type, name)
		} else if(name!=null) {
			return prepareSingleValueDescriptorForNewLocalVariable(type, name)
		} else {
			return prepareSingleValueDescriptorForNewLocalVariable(type)
		}
	}
	
	def prepareSingleValueDescriptorForNewLocalVariable(Type type, String localVariableName) {
		val descr = factory.createSingleVariableDescriptor()
		descr.stringRepresentation = localVariableName
		if(type != null){
			descr.baseType = type.qualifiedName
			descr.fullType = type.qualifiedName
		}
		descr
	}
	
	def prepareSingleValueDescriptorForNewLocalVariable(Type type) {
		val descr = factory.createSingleVariableDescriptor()
		descr.stringRepresentation = "name"
		if(type != null){
			descr.baseType = type.qualifiedName
			descr.fullType = type.qualifiedName
		}
		descr
	}
	
	def prepareSingleValueDescriptorForExistingVariable(Type type, String localVariableName) {
		val descr = factory.createSingleVariableDescriptor()
		descr.stringRepresentation = localVariableName
		if(type != null){
			descr.baseType = type.qualifiedName
			descr.fullType = type.qualifiedName
		}
		descr
	}	
}