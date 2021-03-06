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
package com.incquerylabs.uml.ralf.tests.util.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSendSignalBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory

class DummySendSignalBuilder implements IUmlSendSignalBuilder{
	ValueDescriptor variable
	ValueDescriptor signal
	boolean isInternal
	
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	override build() {
		val descriptor = createOperationCallDescriptor => [
			baseType = variable.baseType
			stringRepresentation = '''«variable.stringRepresentation»->generate_«IF isInternal»internal«ELSE»external«ENDIF»_event(«signal.stringRepresentation»)'''
		]
		descriptor
	}
		
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		this
	}
	
	override setSignal(ValueDescriptor signal) {
		this.signal = signal
		this
	}
	
	override setIsInternal(boolean isInternal) {
		this.isInternal = isInternal
		this
	}
	
}