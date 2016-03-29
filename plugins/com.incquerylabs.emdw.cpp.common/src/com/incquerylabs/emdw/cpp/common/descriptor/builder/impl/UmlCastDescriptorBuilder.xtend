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

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplCastDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCastDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Type

class UmlCastDescriptorBuilder implements IUmlCastDescriptorBuilder {
	extension Logger logger = Logger.getLogger(class)
	private IOoplCastDescriptorBuilder builder
	private UmlToXtumlMapper mapper
	
	private Type type
	private ValueDescriptor descriptor
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppCastDescriptorBuilder(engine)
	}
	
	override setDescriptor(ValueDescriptor castableDescriptor) {
		this.descriptor = castableDescriptor
		this
	}
	
	override setCastingType(Type castingType) {
		this.type = castingType
		this
	}
	
	override build() {
		trace('''Started building''')
		val xumlType = mapper.convertType(type)
		trace('''Resolved type: «type.qualifiedName»''')
		val d = (builder => [
					it.castingType = xumlType
					it.descriptor = descriptor
				]).build
		trace('''Finished building''')
		return d
	}
	
	
}