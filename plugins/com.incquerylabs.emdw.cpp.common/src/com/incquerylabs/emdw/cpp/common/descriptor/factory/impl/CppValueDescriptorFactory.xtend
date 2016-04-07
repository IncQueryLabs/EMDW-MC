/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
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
import org.apache.log4j.Logger

class CppValueDescriptorFactory extends OoplValueDescriptorFactory {
	extension TypeConverter typeConverter
	private CppLiteralConverter converter
	
	private static final String LOCAL_VARIABLE_SUFFIX = "ralf"
	private static final String SEPARATOR = "_"
	
	
	
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
		logger = Logger.getLogger(class)
		index = start_index
		this.parent = parent
		converter = new CppLiteralConverter
		typeConverter = new TypeConverter
	}
	
	
	
	override prepareSingleVariableDescriptorForNewLocalVariable(OOPLType type, String localVariableName, boolean initialize) {
		checkArgument(type!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleVariableDescriptor(type, localVariableName, initialize)
		return preparedDescriptor
	}
	
	def prepareSingleVariableDescriptorForNewLocalVariable(CPPEvent cppEvent, String localVariableName) {
		checkArgument(cppEvent!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleVariableDescriptor(cppEvent, localVariableName, false)
		return preparedDescriptor
	}
	
	override prepareSingleVariableDescriptorForNewLocalVariable(OOPLType type, boolean initialize) {
		checkArgument(type!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleVariableDescriptor(type, (type as CPPQualifiedNamedElement).cppName.escapeName.qualifiedName, initialize)
		return preparedDescriptor
	}
	
	def prepareSingleVariableDescriptorForNewLocalVariable(CPPEvent cppEvent) {
		checkArgument(cppEvent!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleVariableDescriptor(cppEvent, cppEvent.cppName.escapeName.qualifiedName, false)
		return preparedDescriptor
	}
	
	override prepareSingleVariableDescriptorForExistingVariable(OOPLType type, String localVariableName) {
		checkArgument(type!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleVariableDescriptor(type, localVariableName, false)
		return preparedDescriptor
	}
	
	def prepareSingleVariableDescriptorForExistingVariable(CPPEvent cppEvent, String localVariableName) {
		checkArgument(cppEvent!=null, "OOPLType cannot be null")
		val preparedDescriptor = prepareSingleVariableDescriptor(cppEvent, localVariableName, false)
		return preparedDescriptor
	}
	
	override prepareSingleVariableDescriptorForLiteral(OOPLType type, String literal) {
		checkArgument(type!=null, "OOPLType cannot be null")
		checkArgument(type instanceof CPPBasicType, "Literal only could be a CPPBasicType, not a(n) "+type.class.name)
		trace('''Started LiteralDescriptor creation with type[«type.convertToType»] and literal[«literal»]''')
		val basicType = type as CPPBasicType
		val convertedLiteral = converter.convertLiteral(type, literal)
		val preparedDescriptor = factory.createLiteralDescriptor => [
				it.stringRepresentation = convertedLiteral
				it.valueRepresentation = convertedLiteral
				it.pointerRepresentation = convertedLiteral
				it.baseType = basicType.convertToType
				it.fullType = it.baseType
		]
		trace('''Finished LiteralDescriptor creation''')
		return preparedDescriptor
	}
	
	override prepareCollectionVariableDescriptorForNewLocalVariable(BaseContainerImplementation collectionType, OOPLType elementType, String localVariableName) {
		checkArgument(collectionType!=null, "OOPLType (collectionType) cannot be null")
		checkArgument(elementType!=null, "OOPLType (elementType) cannot be null")
		val preparedDescriptor = prepareCollectionVariableDescriptor(collectionType, elementType, localVariableName)
		return preparedDescriptor
	}
	
	def prepareCollectionVariableDescriptorForNewLocalVariable(BaseContainerImplementation collectionType, CPPEvent elementType, String localVariableName) {
		checkArgument(collectionType!=null, "OOPLType (collectionType) cannot be null")
		checkArgument(elementType!=null, "OOPLType (elementType) cannot be null")
		val preparedDescriptor = prepareCollectionVariableDescriptor(collectionType, elementType, localVariableName)
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
		return preparedDescriptor
	}
	
	def prepareCollectionVariableDescriptorForExistingVariable(BaseContainerImplementation collectionType, CPPEvent elementType, String localVariableName) {
		checkArgument(collectionType!=null, "OOPLType (collectionType) cannot be null")
		checkArgument(elementType!=null, "OOPLType (elementType) cannot be null")
		val preparedDescriptor = prepareCollectionVariableDescriptor(collectionType, elementType, localVariableName)
		return preparedDescriptor
	}
	
	private def prepareSingleVariableDescriptor(EObject type, String localVariableName, boolean initialize) {
		trace('''Started SingleVariableDescriptor creation with name[«localVariableName»]''')
		val stringRepresentation = if(initialize) {
			'''«localVariableName» = «typeConverter.getInitialValue(type)»'''
		} else {
			localVariableName
		}
		
		val variableRepresentations = localVariableName.createStringRepresentations(type)
		
		val preparedDescriptor = createSingleVariableDescriptor => [
				it.stringRepresentation = stringRepresentation
				it.valueRepresentation = variableRepresentations.valueRepresentation
				it.pointerRepresentation = variableRepresentations.pointerRepresentation
				it.baseType = type.convertToType
				it.fullType = it.baseType
		]
		trace('''Finished SingleVariableDescriptor creation''')
		return preparedDescriptor
	}
	
	private def prepareCollectionVariableDescriptor(BaseContainerImplementation collectionType, EObject elementType, String localVariableName) {
		trace('''Started CollectionVariableDescriptor creation with name[«localVariableName»]''')
		val variableRepresentations = localVariableName.createStringRepresentations(collectionType)
    		val preparedDescriptor = factory.createCollectionVariableDescriptor => [
				it.stringRepresentation = localVariableName
				it.valueRepresentation = variableRepresentations.valueRepresentation
				it.pointerRepresentation = variableRepresentations.pointerRepresentation
				it.baseType = collectionType.convertToBaseType
				it.templateTypes.add(elementType.convertToType)
				it.fullType = getFullType(baseType, templateTypes)
		] 
		trace('''Finished CollectionVariableDescriptor creation''')
		return preparedDescriptor
	}
	
	private def String escapeName(String name) {
		// first replace all removes every leading : character
		return name.replaceAll("^:+", "").replace(':', '_').replace('.', '_').replace(' ', '_').replace('%', '_')
	}
	
	public def String getNextSuffix() {
		val suffix = '''«SEPARATOR»«LOCAL_VARIABLE_SUFFIX»«SEPARATOR»«index.qualifiedIndex(parent)»'''
		index++
		return suffix
	}
	
	private def String qualifiedName(String name) {
		return '''«SEPARATOR»«SEPARATOR»«name»«getNextSuffix»'''
	}
	
	private def String qualifiedIndex(Integer index, OoplValueDescriptorFactory parent) {
		if(parent!=null) {
			return '''«parent.actualIndex.qualifiedIndex(parent.parent)»«SEPARATOR»«index»'''
		}
		return index.toString
	}
	
}