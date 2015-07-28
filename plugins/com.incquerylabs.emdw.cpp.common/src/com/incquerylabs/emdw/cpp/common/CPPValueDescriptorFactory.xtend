package com.incquerylabs.emdw.cpp.common

import com.ericsson.xtumlrt.oopl.OOPLType
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor

class CPPValueDescriptorFactory {
	static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private LiteralConverter converter
	
	private static final String LOCAL_VARIABLE_PREFIX = "ralf"
	private static final String SEPARATOR = "___"
	
	private CPPValueDescriptorFactory parent
	private int index
	
	
	
	new() {
		this(null, 0)
	}
	
	new(int start_index) {
		this(null, start_index)
	}
	
	new(CPPValueDescriptorFactory parent) {
		this(parent, 0)
	}
	
	new(CPPValueDescriptorFactory parent, int start_index) {
		index = start_index
		this.parent = parent
		converter = new LiteralConverter
	}
	
	
	
	def int getActualIndex() {
		return index
	}
	
	
	
	def prepareSingleValueDescriptor4NewLocalVariable(OOPLType type, String localVariableName) {
		val preparedDescriptor = prepareSingleValueDescriptor(type, localVariableName.qualifiedName)
		index++
		return preparedDescriptor
	}
	
	def prepareSingleValueDescriptor4NewLocalVariable(OOPLType type) {
		val preparedDescriptor = prepareSingleValueDescriptor(type, (type as CPPQualifiedNamedElement).cppName.qualifiedName)
		index++
		return preparedDescriptor
	}
	
	def prepareSingleValueDescriptor4ExistingVariable(OOPLType type, String localVariableName) {
		val preparedDescriptor = prepareSingleValueDescriptor(type, localVariableName)
		return preparedDescriptor
	}
	
	def prepareSingleValueDescriptor4Literal(OOPLType type, String literal) {
		val preparedDescriptor = prepareSingleValueDescriptor(type, converter.convertLiteral(type, literal))
		return preparedDescriptor
	}
	
	def prepareSingleValueDescriptor4Attribute(SingleValueDescriptor attributeOwner, CPPAttribute attribute) {
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
		return (LOCAL_VARIABLE_PREFIX + SEPARATOR + index.qualifiedIndex + SEPARATOR + name)
	}
	
	private def String qualifiedIndex(Integer index) {
		if(parent!=null) {
			return '''«parent.actualIndex.qualifiedIndex»___«index»'''
		}
		return index.toString
	}
	
}