package com.incquerylabs.emdw.cpp.common.factory.impl

import com.ericsson.xtumlrt.oopl.OOPLType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor

import static com.google.common.base.Preconditions.*
import com.ericsson.xtumlrt.oopl.cppmodel.CPPBasicType

class CPPValueDescriptorFactory extends OOPLValueDescriptorFactory {
	private com.incquerylabs.emdw.cpp.common.CPPLiteralConverter converter
	
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
		converter = new com.incquerylabs.emdw.cpp.common.CPPLiteralConverter
	}
	
	
	
	/**
	 * Másik komment
	 */
	override prepareSingleValueDescriptorForNewLocalVariable(OOPLType type, String localVariableName) {
		checkArgument(type!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleValueDescriptor(type, localVariableName.qualifiedName)
		index++
		return preparedDescriptor
	}
	
	override prepareSingleValueDescriptorForNewLocalVariable(OOPLType type) {
		checkArgument(type!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleValueDescriptor(type, (type as CPPQualifiedNamedElement).cppName.qualifiedName)
		index++
		return preparedDescriptor
	}
	
	override prepareSingleValueDescriptorForExistingVariable(OOPLType type, String localVariableName) {
		checkArgument(type!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleValueDescriptor(type, localVariableName)
		return preparedDescriptor
	}
	
	override prepareSingleValueDescriptorForLiteral(OOPLType type, String literal) {
		checkArgument(type!=null, "OOPLType cannot be null")
		checkArgument(type instanceof CPPBasicType, "Literal only could be a CPPBasicType, not a(n) "+type.class.name)
		val preparedDescriptor = factory.createSingleValueDescriptor => [
				it.stringRepresentation = converter.convertLiteral(type, literal)
				it.valueType = (type as CPPBasicType).cppName
		]
		return preparedDescriptor
	}
	
	override prepareSingleValueDescriptorForAttribute(SingleValueDescriptor attributeOwner, CPPAttribute attribute) {
		checkArgument(attributeOwner!=null, "Attribute owner cannot be null")
		checkArgument(attribute!=null, "CPPAttribute cannot be null")
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