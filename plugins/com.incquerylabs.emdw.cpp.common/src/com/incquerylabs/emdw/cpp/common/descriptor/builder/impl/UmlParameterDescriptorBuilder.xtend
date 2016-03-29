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

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplParameterBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlParameterDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Parameter

class UmlParameterDescriptorBuilder implements IUmlParameterDescriptorBuilder {
	extension Logger logger = Logger.getLogger(class)

	UmlToXtumlMapper mapper
	IOoplParameterBuilder parameterBuilder
	
	Parameter parameter
	
	new(AdvancedIncQueryEngine engine) {
		this.mapper = new UmlToXtumlMapper(engine)
		this.parameterBuilder = new CppParameterBuilder(engine)
	}
	
	override setParameter(Parameter parameter) {
		this.parameter = parameter
		this
	}
	
	override build() {
		trace('''Started building''')
		val xtumlParameter = mapper.convertParameter(parameter)
		trace('''Resolved parameter: «xtumlParameter.name»''')
		val descriptor = (parameterBuilder => [
			it.parameter = xtumlParameter
 		]).build
 		trace('''Finished building''')
 		return descriptor
	}
	
}