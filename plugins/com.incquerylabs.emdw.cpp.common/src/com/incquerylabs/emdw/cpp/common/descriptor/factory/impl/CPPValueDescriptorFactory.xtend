package com.incquerylabs.emdw.cpp.common.descriptor.factory.impl

import com.ericsson.xtumlrt.oopl.OOPLType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPBasicType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.incquerylabs.emdw.cpp.common.CPPLiteralConverter

import static com.google.common.base.Preconditions.*

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
	
	
	
	/**
	 * Másik komment
	 */
	override prepareSingleVariableDescriptorForNewLocalVariable(OOPLType type, String localVariableName) {
		checkArgument(type!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleVariableDescriptor(type, localVariableName.qualifiedName)
		index++
		return preparedDescriptor
	}
	
	override prepareSingleVariableDescriptorForNewLocalVariable(OOPLType type) {
		checkArgument(type!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleVariableDescriptor(type, (type as CPPQualifiedNamedElement).cppName.qualifiedName)
		index++
		return preparedDescriptor
	}
	
	override prepareSingleVariableDescriptorForExistingVariable(OOPLType type, String localVariableName) {
		checkArgument(type!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleVariableDescriptor(type, localVariableName)
		return preparedDescriptor
	}
	
	override prepareSingleVariableDescriptorForLiteral(OOPLType type, String literal) {
		checkArgument(type!=null, "OOPLType cannot be null")
		checkArgument(type instanceof CPPBasicType, "Literal only could be a CPPBasicType, not a(n) "+type.class.name)
		val preparedDescriptor = factory.createLiteralDescriptor => [
				it.stringRepresentation = converter.convertLiteral(type, literal)
				it.baseType = (type as CPPBasicType).cppName
				it.fullType = it.baseType
		]
		return preparedDescriptor
	}
	
	override prepareCollectionVariableDescriptorForNewLocalVariable(OOPLType collectionType, OOPLType elementType, String localVariableName) {
		checkArgument(collectionType!=null, "OOPLType (collectionType) cannot be null")
		checkArgument(elementType!=null, "OOPLType (elementType) cannot be null")
		val preparedDescriptor = prepareCollectionVariableDescriptor(collectionType, elementType, localVariableName.qualifiedName)
		return preparedDescriptor
	}
	
	override prepareCollectionVariableDescriptorForNewLocalVariable(OOPLType collectionType, OOPLType elementType) {
		checkArgument(collectionType!=null, "OOPLType (collectionType) cannot be null")
		checkArgument(elementType!=null, "OOPLType (elementType) cannot be null")
		val preparedDescriptor = prepareCollectionVariableDescriptor(collectionType, elementType, (collectionType as CPPQualifiedNamedElement).cppName.qualifiedName)
		return preparedDescriptor
	}
	
	override prepareCollectionVariableDescriptorForExistingVariable(OOPLType collectionType, OOPLType elementType, String localVariableName) {
		checkArgument(collectionType!=null, "OOPLType (collectionType) cannot be null")
		checkArgument(elementType!=null, "OOPLType (elementType) cannot be null")
		val preparedDescriptor = prepareCollectionVariableDescriptor(collectionType, elementType, localVariableName)
		return preparedDescriptor
	}
	
	
	
	private def prepareSingleVariableDescriptor(OOPLType type, String localVariableName) {
		val preparedDescriptor = factory.createSingleVariableDescriptor => [
				it.stringRepresentation = localVariableName
				it.baseType = (type as CPPQualifiedNamedElement).cppQualifiedName
				it.fullType = it.baseType
		]
		return preparedDescriptor
	}
	
	private def prepareCollectionVariableDescriptor(OOPLType collectionType, OOPLType elementType, String localVariableName) {
		val preparedDescriptor = factory.createCollectionVariableDescriptor => [
				it.stringRepresentation = localVariableName
				it.baseType = (collectionType as CPPQualifiedNamedElement).cppQualifiedName
				it.templateTypes.add((elementType as CPPQualifiedNamedElement).cppQualifiedName)
				it.fullType = '''«it.baseType»< «FOR templateType : it.templateTypes SEPARATOR ", "»«templateType»«ENDFOR» >'''
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