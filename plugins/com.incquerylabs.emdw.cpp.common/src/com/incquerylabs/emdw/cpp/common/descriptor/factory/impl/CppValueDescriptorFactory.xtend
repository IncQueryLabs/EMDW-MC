package com.incquerylabs.emdw.cpp.common.descriptor.factory.impl

import com.ericsson.xtumlrt.oopl.OOPLBasicType
import com.ericsson.xtumlrt.oopl.OOPLEnumType
import com.ericsson.xtumlrt.oopl.OOPLType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPBasicType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefSimpleCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEvent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.incquerylabs.emdw.cpp.common.CppLiteralConverter

import static com.google.common.base.Preconditions.*

class CppValueDescriptorFactory extends OoplValueDescriptorFactory {
	private CppLiteralConverter converter
	
	private static final String LOCAL_VARIABLE_PREFIX = "ralf"
	private static final String SEPARATOR = "__"
	
	
	
	new() {
		this(null, 0)
	}
	
	new(int start_index) {
		this(null, start_index)
	}
	
	new(OoplValueDescriptorFactory parent) {
		this(parent, 0)
	}
	
	new(OoplValueDescriptorFactory parent, int start_index) {
		index = start_index
		this.parent = parent
		converter = new CppLiteralConverter
	}
	
	
	
	override prepareSingleVariableDescriptorForNewLocalVariable(OOPLType type, String localVariableName) {
		checkArgument(type!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleVariableDescriptor(type, localVariableName.qualifiedName)
		index++
		return preparedDescriptor
	}
	
	def prepareSingleVariableDescriptorForNewLocalVariable(CPPEvent cppEvent, String localVariableName) {
		checkArgument(cppEvent!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleVariableDescriptor(cppEvent, localVariableName.qualifiedName)
		index++
		return preparedDescriptor
	}
	
	override prepareSingleVariableDescriptorForNewLocalVariable(OOPLType type) {
		checkArgument(type!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleVariableDescriptor(type, (type as CPPQualifiedNamedElement).cppName.escapeName.qualifiedName)
		index++
		return preparedDescriptor
	}
	
	def prepareSingleVariableDescriptorForNewLocalVariable(CPPEvent cppEvent) {
		checkArgument(cppEvent!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleVariableDescriptor(cppEvent, cppEvent.cppName.escapeName.qualifiedName)
		index++
		return preparedDescriptor
	}
	
	override prepareSingleVariableDescriptorForExistingVariable(OOPLType type, String localVariableName) {
		checkArgument(type!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleVariableDescriptor(type, localVariableName)
		return preparedDescriptor
	}
	
	def prepareSingleVariableDescriptorForExistingVariable(CPPEvent cppEvent, String localVariableName) {
		checkArgument(cppEvent!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleVariableDescriptor(cppEvent, localVariableName)
		return preparedDescriptor
	}
	
	override prepareSingleVariableDescriptorForLiteral(OOPLType type, String literal) {
		checkArgument(type!=null, "OOPLType cannot be null")
		checkArgument(type instanceof CPPBasicType, "Literal only could be a CPPBasicType, not a(n) "+type.class.name)
		val basicType = type as CPPBasicType
		val preparedDescriptor = factory.createLiteralDescriptor => [
				it.stringRepresentation = converter.convertLiteral(type, literal)
				if(basicType.cppQualifiedName != null){
					it.baseType = basicType.cppQualifiedName					
				} else {
					it.baseType = basicType.cppName			
				}
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
	
	def prepareCollectionVariableDescriptorForNewLocalVariable(OOPLType collectionType, CPPEvent elementType, String localVariableName) {
		checkArgument(collectionType!=null, "OOPLType (collectionType) cannot be null")
		checkArgument(elementType!=null, "OOPLType (elementType) cannot be null")
		val preparedDescriptor = prepareCollectionVariableDescriptor(collectionType, elementType, localVariableName.qualifiedName)
		return preparedDescriptor
	}
	
	override prepareCollectionVariableDescriptorForNewLocalVariable(OOPLType collectionType, OOPLType elementType) {
		checkArgument(collectionType!=null, "OOPLType (collectionType) cannot be null")
		checkArgument(elementType!=null, "OOPLType (elementType) cannot be null")
		val preparedDescriptor = prepareCollectionVariableDescriptor(collectionType, elementType, (collectionType as CPPQualifiedNamedElement).cppName.escapeName.qualifiedName)
		return preparedDescriptor
	}
	
	def prepareCollectionVariableDescriptorForNewLocalVariable(OOPLType collectionType, CPPEvent elementType) {
		checkArgument(collectionType!=null, "OOPLType (collectionType) cannot be null")
		checkArgument(elementType!=null, "OOPLType (elementType) cannot be null")
		val preparedDescriptor = prepareCollectionVariableDescriptor(collectionType, elementType, (collectionType as CPPQualifiedNamedElement).cppName.escapeName.qualifiedName)
		return preparedDescriptor
	}
	
	override prepareCollectionVariableDescriptorForExistingVariable(OOPLType collectionType, OOPLType elementType, String localVariableName) {
		checkArgument(collectionType!=null, "OOPLType (collectionType) cannot be null")
		checkArgument(elementType!=null, "OOPLType (elementType) cannot be null")
		val preparedDescriptor = prepareCollectionVariableDescriptor(collectionType, elementType, localVariableName)
		return preparedDescriptor
	}
	
	def prepareCollectionVariableDescriptorForExistingVariable(OOPLType collectionType, CPPEvent elementType, String localVariableName) {
		checkArgument(collectionType!=null, "OOPLType (collectionType) cannot be null")
		checkArgument(elementType!=null, "OOPLType (elementType) cannot be null")
		val preparedDescriptor = prepareCollectionVariableDescriptor(collectionType, elementType, localVariableName)
		return preparedDescriptor
	}
	
	
	
	private dispatch def prepareSingleVariableDescriptor(OOPLType type, String localVariableName) {
		val preparedDescriptor = createSingleVariableDescriptor => [
				it.stringRepresentation = localVariableName
				it.baseType = (type as CPPQualifiedNamedElement).cppQualifiedName.toReference
				it.fullType = it.baseType
		]
		return preparedDescriptor
	}
	
	private dispatch def prepareSingleVariableDescriptor(OOPLEnumType type, String localVariableName) {
		val preparedDescriptor = createSingleVariableDescriptor => [
				it.stringRepresentation = localVariableName
				it.baseType = (type as CPPQualifiedNamedElement).cppQualifiedName
				it.fullType = it.baseType
		]
		return preparedDescriptor
	}
	
	private dispatch def prepareSingleVariableDescriptor(OOPLBasicType type, String localVariableName) {
		val preparedDescriptor = createSingleVariableDescriptor => [
				it.stringRepresentation = localVariableName
				it.baseType = (type as CPPQualifiedNamedElement).cppName
				it.fullType = it.baseType
		]
		return preparedDescriptor
	}
	
	private dispatch def prepareSingleVariableDescriptor(CPPEvent cppEvent, String localVariableName) {
		val preparedDescriptor = createSingleVariableDescriptor => [
				it.stringRepresentation = localVariableName
				it.baseType = cppEvent.cppQualifiedName.toEvent.toReference
				it.fullType = it.baseType
		]
		return preparedDescriptor
	}
	
	private def String toReference(String type) {
		'''«type»*'''
	}
	
	private def String toEvent(String event) {
		'''«event»_event'''
	}
	
	private dispatch def prepareCollectionVariableDescriptor(OOPLType collectionType, OOPLType elementType, String localVariableName) {
		val preparedDescriptor = factory.createCollectionVariableDescriptor => [
				it.stringRepresentation = localVariableName
				it.baseType = (collectionType as CPPQualifiedNamedElement).cppQualifiedName
				it.templateTypes.add((elementType as CPPQualifiedNamedElement).cppQualifiedName)
				it.fullType = '''«it.baseType»< «FOR templateType : it.templateTypes SEPARATOR ", "»«templateType»«ENDFOR» >'''
		]
		return preparedDescriptor
	}
	
	private dispatch def prepareCollectionVariableDescriptor(CPPClassRefSimpleCollection collectionType, OOPLType elementType, String localVariableName) {
		val preparedDescriptor = factory.createCollectionVariableDescriptor => [
				it.stringRepresentation = localVariableName
				it.baseType = (collectionType).cppContainer
				it.templateTypes.add((elementType as CPPQualifiedNamedElement).cppQualifiedName)
				it.fullType = '''«it.baseType»< «FOR templateType : it.templateTypes SEPARATOR ", "»«templateType»«ENDFOR» >'''
		]
		return preparedDescriptor
	}
	
	private dispatch def prepareCollectionVariableDescriptor(OOPLType collectionType, CPPEvent elementType, String localVariableName) {
		val preparedDescriptor = factory.createCollectionVariableDescriptor => [
				it.stringRepresentation = localVariableName
				it.baseType = (collectionType as CPPQualifiedNamedElement).cppQualifiedName
				it.templateTypes.add(elementType.cppQualifiedName)
				it.fullType = '''«it.baseType»< «FOR templateType : it.templateTypes SEPARATOR ", "»«templateType»«ENDFOR» >'''
		]
		return preparedDescriptor
	}
	
	private def String escapeName(String name) {
		return name.replace(':', '_').replace('.', '_').replace(' ', '_').replace('%', '_')
	}
	
	private def String qualifiedName(String name) {
		return '''«SEPARATOR»«LOCAL_VARIABLE_PREFIX»«SEPARATOR»«index.qualifiedIndex(parent)»«SEPARATOR»«name»'''
	}
	
	private def String qualifiedIndex(Integer index, OoplValueDescriptorFactory parent) {
		if(parent!=null) {
			return '''«parent.actualIndex.qualifiedIndex(parent.parent)»«SEPARATOR»«index»'''
		}
		return index.toString
	}
	
}