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

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlEnumerationLiteralDescriptorBuilder
import org.apache.log4j.Logger
import org.eclipse.uml2.uml.EnumerationLiteral
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplEnumerationLiteralBuilder

class UmlEnumerationLiteralDescriptorBuilder implements IUmlEnumerationLiteralDescriptorBuilder {
	extension Logger logger = Logger.getLogger(class)
	
	EnumerationLiteral enumLiteral
	
	UmlToXtumlMapper mapper	
	IOoplEnumerationLiteralBuilder builder
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppEnumerationLiteralBuilder(engine)
	}
	
	override build() {
		trace('''Started building''')
		val xtumlEnumLiteral = mapper.convertEnumLiteral(enumLiteral)
		val enumLiteralDescriptor = (builder => [
			it.enumerationLiteral = xtumlEnumLiteral 
		]).build
		trace('''Finished building''')
		enumLiteralDescriptor
	}


	override setEnumerationLiteral(EnumerationLiteral enumLiteral) {
		this.enumLiteral = enumLiteral
		this
	}
}