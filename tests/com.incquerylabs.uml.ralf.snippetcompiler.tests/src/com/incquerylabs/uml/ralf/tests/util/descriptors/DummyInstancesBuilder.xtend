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

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlInstancesBuilder
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.Type

class DummyInstancesBuilder implements IUmlInstancesBuilder {
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	Type umlClass
	
	override setUmlClass(Type type) {
		this.umlClass = type
		this
	}
	
	override build() {
		val descriptor = createCollectionVariableDescriptor => [
			if(umlClass == null){
				throw new UnsupportedOperationException("Uml class must be set to build instances descriptor")
			}else{
				baseType = umlClass.qualifiedName
				fullType = umlClass.qualifiedName
			}
			stringRepresentation = '''«umlClass.qualifiedName»::_instances()'''
		]
		
		descriptor
	}
	
}