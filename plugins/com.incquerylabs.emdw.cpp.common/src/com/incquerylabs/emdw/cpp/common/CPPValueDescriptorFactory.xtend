package com.incquerylabs.emdw.cpp.common

import com.ericsson.xtumlrt.oopl.OOPLType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor

class CPPValueDescriptorFactory extends OOPLValueDescriptorFactory {
	private CPPLiteralConverter converter
	
	private static final String LOCAL_VARIABLE_PREFIX = "ralf"
	private static final String SEPARATOR = "__"
	
	
	
	new() {
		this(null, 0)
	}
	
	new(int start_index) {
		this(null, start_index)
	}
	
	new(OOPLValueDescriptorFactory parent) {
		this(parent, 0)
	}
	
	new(OOPLValueDescriptorFactory parent, int start_index) {
		index = start_index
		this.parent = parent
		converter = new CPPLiteralConverter
	}
	
	
	
	override prepareSingleValueDescriptorForNewLocalVariable(OOPLType type, String localVariableName) {
		val preparedDescriptor = prepareSingleValueDescriptor(type, localVariableName.qualifiedName)
		index++
		return preparedDescriptor
	}
	
	override prepareSingleValueDescriptorForNewLocalVariable(OOPLType type) {
		val preparedDescriptor = prepareSingleValueDescriptor(type, (type as CPPQualifiedNamedElement).cppName.qualifiedName)
		index++
		return preparedDescriptor
	}
	
	override prepareSingleValueDescriptorForExistingVariable(OOPLType type, String localVariableName) {
		val preparedDescriptor = prepareSingleValueDescriptor(type, localVariableName)
		return preparedDescriptor
	}
	
	override prepareSingleValueDescriptorForLiteral(OOPLType type, String literal) {
		val preparedDescriptor = prepareSingleValueDescriptor(type, converter.convertLiteral(type, literal))
		return preparedDescriptor
	}
	
	override prepareSingleValueDescriptorForAttribute(SingleValueDescriptor attributeOwner, CPPAttribute attribute) {
		val preparedDescriptor = prepareSingleValueDescriptor(attribute.type, 
									attributeOwner.stringRepresentation + attribute.cppQualifiedName)
		return preparedDescriptor
	}
	
	
	
	private def prepareSingleValueDescriptor(OOPLType type, String localVariableName) {
		val preparedDescriptor = factory.createSingleValueDescriptor => [
				it.stringRepresentation = localVariableName
				it.valueType = (type as CPPQualifiedNamedElement).cppQualifiedName
		]
		return preparedDescriptor
	}
	
	private def String qualifiedName(String name) {
		return '''«SEPARATOR»«LOCAL_VARIABLE_PREFIX»«SEPARATOR»«index.qualifiedIndex»«SEPARATOR»«name»'''
	}
	
	private def String qualifiedIndex(Integer index) {
		if(parent!=null) {
			return '''«parent.actualIndex.qualifiedIndex»«SEPARATOR»«index»'''
		}
		return index.toString
	}
	
}