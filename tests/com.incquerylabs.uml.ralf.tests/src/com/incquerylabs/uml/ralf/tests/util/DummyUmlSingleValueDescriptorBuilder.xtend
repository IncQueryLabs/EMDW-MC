package com.incquerylabs.uml.ralf.tests.util

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSingleValueDescriptorBuilder
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.Type

import static com.google.common.base.Preconditions.*

class DummyUmlSingleValueDescriptorBuilder implements IUmlSingleValueDescriptorBuilder{
	private String name
	private String literal
	private Type type
	private boolean isExistingVariable
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	override setName(String name) {
		this.name = name
		this
	}
	
	override setLiteral(String literal) {
		this.literal=literal
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
		} else if(literal!=null) {
			return prepareSingleValueDescriptorForLiteral(type, literal)
		} else if(name!=null) {
			return prepareSingleValueDescriptorForNewLocalVariable(type, name)
		} else {
			return prepareSingleValueDescriptorForNewLocalVariable(type)
		}
	}
	
	def prepareSingleValueDescriptorForNewLocalVariable(Type type, String localVariableName) {
		val descr = factory.createSingleValueDescriptor()
		descr.stringRepresentation = localVariableName
		val UMLType = type as Type
		if(UMLType != null){
			descr.valueType = UMLType.qualifiedName
		}
		descr
	}
	
	def prepareSingleValueDescriptorForNewLocalVariable(Type type) {
		val descr = factory.createSingleValueDescriptor()
		descr.stringRepresentation = "name"
		val UMLType = type as Type
		if(UMLType != null){
			descr.valueType = UMLType.qualifiedName
		}
		descr
	}
	
	def prepareSingleValueDescriptorForExistingVariable(Type type, String localVariableName) {
		val descr = factory.createSingleValueDescriptor()
		descr.stringRepresentation = localVariableName
		val UMLType = type as Type
		if(UMLType != null){
			descr.valueType = UMLType.qualifiedName
		}
		descr
	}
	
	def prepareSingleValueDescriptorForLiteral(Type type, String literal) {
		val descr = factory.createSingleValueDescriptor()
		descr.stringRepresentation = literal
		val UMLType = type as Type
		if(UMLType != null){
			descr.valueType = UMLType.qualifiedName
		}
		descr
	}
	
}