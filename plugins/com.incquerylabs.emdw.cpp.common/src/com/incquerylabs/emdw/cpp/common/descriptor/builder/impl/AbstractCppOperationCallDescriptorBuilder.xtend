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

import com.ericsson.xtumlrt.oopl.cppmodel.CPPFormalParameter
import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.ericsson.xtumlrt.oopl.cppmodel.CPPReturnValue
import com.google.common.base.Preconditions
import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.cpp.common.util.XtTypedValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import java.util.List
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import org.apache.log4j.Logger

abstract class AbstractCppOperationCallDescriptorBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	protected extension Logger logger
	
	protected XtumlToOoplMapper mapper
	protected extension TypeConverter converter
	protected CPPOperation cppOperation
	protected List<XtTypedValueDescriptor<? extends ValueDescriptor>> params
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new XtumlToOoplMapper(engine)
		converter = new TypeConverter
	}
	
	def prepareOperationCallDescriptor(Operation operation) {
		prepareOperationCallDescriptor(operation, true)
	}
	
	def prepareOperationCallDescriptor(Operation operation, boolean calculateTypes) {
		cppOperation = mapper.convertOperation(operation)
		if(cppOperation!=null) {
			trace('''Resolved operation: «cppOperation.cppQualifiedName»''')
		}
		val ocd = factory.createOperationCallDescriptor => [
			if(calculateTypes) {
				val returnValue = cppOperation.subElements.filter(CPPReturnValue).head
				it.baseType = returnValue.convertToBaseType
				it.fullType = returnValue.convertToType
			}
		]
		return ocd
	}
	
	def String getParameterString() {
		'''«FOR param : parameterList SEPARATOR ", "»«param»«ENDFOR»'''
	}
	
	def getParameterList() {
		val parameterDescriptors = if(params != null) params else #[]
		
		if(cppOperation != null){
			val parameterStrings = newArrayList
			val cppFormalParameters = cppOperation.subElements.filter(CPPFormalParameter)
			Preconditions.checkState(parameterDescriptors.size == cppFormalParameters.size, 
			'''Invalid number of parameters provided when calling operation «cppOperation.cppName»:
					received parameters «FOR p : parameterDescriptors SEPARATOR ','»«p.descriptor.stringRepresentation» : «p.descriptor.fullType»«ENDFOR»
					expected parameters «FOR p : cppFormalParameters SEPARATOR ','»«p.cppName» : «p.type.convertToType»«ENDFOR»''')
			for(int i : 0..<parameterDescriptors.size) {
				if(cppFormalParameters.get(i).isReferenceType) {
					parameterStrings += params.get(i).descriptor.pointerRepresentation
				} else {
					parameterStrings += params.get(i).descriptor.valueRepresentation
				}
			}
			
			parameterStrings
		} else {
			parameterDescriptors.map[
				if(mapper.convertType(type).isReferenceType) {
					descriptor.pointerRepresentation
				} else {
					descriptor.valueRepresentation
				}
			]
		}
	}
}