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

import com.ericsson.xtumlrt.oopl.cppmodel.CPPReturnValue
import com.google.common.base.Preconditions
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.CppValueDescriptorFactory
import com.incquerylabs.emdw.cpp.common.util.XtTypedValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Operation

class CppOperationCallBuilder extends AbstractCppOperationCallDescriptorBuilder implements IOoplOperationCallBuilder {
	
	private ValueDescriptor variable
	private Operation operation
	private String collectionType
	private String operationName
	private CppValueDescriptorFactory cvdfactory
	
	
	new(CppValueDescriptorFactory factory, AdvancedIncQueryEngine engine) {
		super(engine)
		logger = Logger.getLogger(class)
		this.cvdfactory = factory
	}
	
	
	override build() {
		Preconditions::checkNotNull(operation)
		trace('''Started building''')
		
		val od = prepareOperationCallDescriptor(operation)
		trace('''Resolved operation: «cppOperation.cppQualifiedName»''')
		if(mapper.isHiddenByChild(operation)) {
			od.stringRepresentation = '''«variable.stringRepresentation»->«cppOperation.cppQualifiedName»(«parameterString»)'''
		} else {
			od.stringRepresentation = '''«variable.stringRepresentation»->«cppOperation.cppName»(«parameterString»)'''
		}
			
		val returnValue = cppOperation.subElements.filter(CPPReturnValue).head
		val convertedRepresentations = od.stringRepresentation.createStringRepresentations(returnValue)
			
		od.valueRepresentation = convertedRepresentations.valueRepresentation
		od.pointerRepresentation = convertedRepresentations.pointerRepresentation
		
		trace('''Finished building''')
		return od
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
	override setOperation(Operation operation) {
		this.operation = operation
		return this
	}
	
	override setParameters(XtTypedValueDescriptor<? extends ValueDescriptor>... params) {
		this.params = params
		return this
	}
	
	override setOperationName(String operationName) {
		this.operationName = operationName
		return this
	}
	
	override setCollectionType(String collectionType) {
		this.collectionType = collectionType
		return this
	}
	
}