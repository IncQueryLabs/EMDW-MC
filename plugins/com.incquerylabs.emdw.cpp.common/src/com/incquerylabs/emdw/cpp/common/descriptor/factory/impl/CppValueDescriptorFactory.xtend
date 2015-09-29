package com.incquerylabs.emdw.cpp.common.descriptor.factory.impl

import com.ericsson.xtumlrt.oopl.BaseContainerImplementation
import com.ericsson.xtumlrt.oopl.OOPLType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPBasicType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEvent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.incquerylabs.emdw.cpp.common.CppLiteralConverter
import com.incquerylabs.emdw.cpp.common.TypeConverter
import org.eclipse.emf.ecore.EObject

import static com.google.common.base.Preconditions.*

class CppValueDescriptorFactory extends OoplValueDescriptorFactory {
	extension TypeConverter typeConverter
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
		typeConverter = new TypeConverter
	}
	
	
	
	override prepareSingleVariableDescriptorForNewLocalVariable(OOPLType type, String localVariableName) {
		checkArgument(type!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleVariableDescriptor(type, localVariableName.qualifiedName)
		return preparedDescriptor
	}
	
	def prepareSingleVariableDescriptorForNewLocalVariable(CPPEvent cppEvent, String localVariableName) {
		checkArgument(cppEvent!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleVariableDescriptor(cppEvent, localVariableName.qualifiedName)
		return preparedDescriptor
	}
	
	override prepareSingleVariableDescriptorForNewLocalVariable(OOPLType type) {
		checkArgument(type!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleVariableDescriptor(type, (type as CPPQualifiedNamedElement).cppName.escapeName.qualifiedName)
		return preparedDescriptor
	}
	
	def prepareSingleVariableDescriptorForNewLocalVariable(CPPEvent cppEvent) {
		checkArgument(cppEvent!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleVariableDescriptor(cppEvent, cppEvent.cppName.escapeName.qualifiedName)
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
		val convertedLiteral = converter.convertLiteral(type, literal)
		val preparedDescriptor = factory.createLiteralDescriptor => [
				it.stringRepresentation = convertedLiteral
				it.valueRepresentation = convertedLiteral
				it.pointerRepresentation = convertedLiteral
				it.baseType = basicType.convertToType
				it.fullType = it.baseType
		]
		return preparedDescriptor
	}
	
	override prepareCollectionVariableDescriptorForNewLocalVariable(BaseContainerImplementation collectionType, OOPLType elementType, String localVariableName) {
		checkArgument(collectionType!=null, "OOPLType (collectionType) cannot be null")
		checkArgument(elementType!=null, "OOPLType (elementType) cannot be null")
		val preparedDescriptor = prepareCollectionVariableDescriptor(collectionType, elementType, localVariableName.qualifiedName)
		return preparedDescriptor
	}
	
	def prepareCollectionVariableDescriptorForNewLocalVariable(BaseContainerImplementation collectionType, CPPEvent elementType, String localVariableName) {
		checkArgument(collectionType!=null, "OOPLType (collectionType) cannot be null")
		checkArgument(elementType!=null, "OOPLType (elementType) cannot be null")
		val preparedDescriptor = prepareCollectionVariableDescriptor(collectionType, elementType, localVariableName.qualifiedName)
		return preparedDescriptor
	}
	
	override prepareCollectionVariableDescriptorForNewLocalVariable(BaseContainerImplementation collectionType, OOPLType elementType) {
		checkArgument(collectionType!=null, "OOPLType (collectionType) cannot be null")
		checkArgument(elementType!=null, "OOPLType (elementType) cannot be null")
		val preparedDescriptor = prepareCollectionVariableDescriptor(collectionType, elementType, collectionType.containerQualifiedName.escapeName.qualifiedName)
		return preparedDescriptor
	}
	
	def prepareCollectionVariableDescriptorForNewLocalVariable(BaseContainerImplementation collectionType, CPPEvent elementType) {
		checkArgument(collectionType!=null, "OOPLType (collectionType) cannot be null")
		checkArgument(elementType!=null, "OOPLType (elementType) cannot be null")
		val preparedDescriptor = prepareCollectionVariableDescriptor(collectionType, elementType, collectionType.containerQualifiedName.escapeName.qualifiedName)
		return preparedDescriptor
	}
	
	override prepareCollectionVariableDescriptorForExistingVariable(BaseContainerImplementation collectionType, OOPLType elementType, String localVariableName) {
		checkArgument(collectionType!=null, "OOPLType (collectionType) cannot be null")
		checkArgument(elementType!=null, "OOPLType (elementType) cannot be null")
		val preparedDescriptor = prepareCollectionVariableDescriptor(collectionType, elementType, localVariableName)
		index++
		return preparedDescriptor
	}
	
	def prepareCollectionVariableDescriptorForExistingVariable(BaseContainerImplementation collectionType, CPPEvent elementType, String localVariableName) {
		checkArgument(collectionType!=null, "OOPLType (collectionType) cannot be null")
		checkArgument(elementType!=null, "OOPLType (elementType) cannot be null")
		val preparedDescriptor = prepareCollectionVariableDescriptor(collectionType, elementType, localVariableName)
		index++
		return preparedDescriptor
	}
	
	private def prepareSingleVariableDescriptor(EObject type, String localVariableName) {
		
		val variableRepresentations = localVariableName.createStringRepresentations(type)
		
		val preparedDescriptor = createSingleVariableDescriptor => [
				it.stringRepresentation = localVariableName
				it.valueRepresentation = variableRepresentations.valueRepresentation
				it.pointerRepresentation = variableRepresentations.pointerRepresentation
				it.baseType = type.convertToType
				it.fullType = it.baseType
		]
		return preparedDescriptor
	}
	
	private def prepareCollectionVariableDescriptor(BaseContainerImplementation collectionType, EObject elementType, String localVariableName) {
		val variableRepresentations = localVariableName.createStringRepresentations(collectionType)
		val preparedDescriptor = factory.createCollectionVariableDescriptor => [
				it.stringRepresentation = localVariableName
				it.valueRepresentation = variableRepresentations.valueRepresentation
				it.pointerRepresentation = variableRepresentations.pointerRepresentation
				it.baseType = collectionType.convertToBaseType
				it.templateTypes.add(elementType.convertToType)
				it.fullType = getFullType(baseType, templateTypes)
		]
		return preparedDescriptor
	}
	
	private def String escapeName(String name) {
		return name.replace(':', '_').replace('.', '_').replace(' ', '_').replace('%', '_')
	}
	
	public def String getNextPrefix() {
		val prefix = '''«SEPARATOR»«LOCAL_VARIABLE_PREFIX»«SEPARATOR»«index.qualifiedIndex(parent)»«SEPARATOR»'''
		index++
		return prefix
	}
	
	private def String qualifiedName(String name) {
		return '''«getNextPrefix»«name»'''
	}
	
	private def String qualifiedIndex(Integer index, OoplValueDescriptorFactory parent) {
		if(parent!=null) {
			return '''«parent.actualIndex.qualifiedIndex(parent.parent)»«SEPARATOR»«index»'''
		}
		return index.toString
	}
	
}