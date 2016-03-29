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
package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplCollectionOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.cpp.common.util.XtTypedValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import java.util.ArrayList
import java.util.List
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Type

class CppCollectionOperationCallBuilder implements IOoplCollectionOperationCallBuilder {
	extension Logger logger = Logger.getLogger(class)
	static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	XtumlToOoplMapper mapper
	extension TypeConverter converter

	ValueDescriptor variable
	Type returnType
	String operationName
	List<XtTypedValueDescriptor<? extends ValueDescriptor>> params
	
	new(AdvancedIncQueryEngine engine) {
		this.mapper = new XtumlToOoplMapper(engine)
		this.converter = new TypeConverter
	}
	
	override build() {
		trace('''Started building''')
		val ooplReturnType = mapper.convertType(returnType)
		
		val collectionClass = mapper.findCollectionImplementation(variable.baseType)
		trace('''Resolved collection type: «(collectionClass as CPPClass).cppQualifiedName»''')
		val operationNamespace = (collectionClass as CPPClass).cppQualifiedName
		val parameterList = new ArrayList(parameterList)
		parameterList.add(0, variable.valueRepresentation)
		val stringRepresentation = generateOperationCall(operationNamespace, operationName, parameterList)
		
		val representations = stringRepresentation.createStringRepresentations(ooplReturnType)		
		val ocd = factory.createOperationCallDescriptor => [
			it.baseType = converter.convertToBaseType(ooplReturnType)			
			it.fullType = converter.convertToType(ooplReturnType)
			it.stringRepresentation = stringRepresentation
			it.valueRepresentation = representations.valueRepresentation
			it.pointerRepresentation = representations.pointerRepresentation
		]	
		trace('''Finished building''')
		return ocd
	}
	
	private def String generateOperationCall(String namespace, String operation, String... params) {
		'''«namespace»::«operation»(«FOR param : params SEPARATOR ", "»«param»«ENDFOR»)'''
	}
	
	def List<String> getParameterList() {
		params.map[
			if(mapper.convertType(type).isReferenceType) {
				descriptor.pointerRepresentation
			} else {
				descriptor.valueRepresentation
			}
		]
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		this
	}
	
	override setOperationReturnType(Type returnType) {
		this.returnType = returnType
		this
	}
	
	override setOperationName(String operationName) {
		this.operationName = operationName
		this
	}
	
	override setParameters(XtTypedValueDescriptor<? extends ValueDescriptor>... params) {
		this.params = params
		this
	}
	
}
