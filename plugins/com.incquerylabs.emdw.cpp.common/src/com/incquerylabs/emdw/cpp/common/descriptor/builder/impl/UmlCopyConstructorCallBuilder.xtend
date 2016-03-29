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

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplCopyConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCopyConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent
import org.eclipse.uml2.uml.Signal
import org.eclipse.uml2.uml.Type

class UmlCopyConstructorCallBuilder implements IUmlCopyConstructorCallBuilder {
	extension Logger logger = Logger.getLogger(class)
	
	private UmlToXtumlMapper mapper
	private IOoplCopyConstructorCallBuilder builder
	
	private Type type
	private ValueDescriptor param
	
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppCopyConstructorCallBuilder(engine)
	}
	
	
	override build() {
		if(type instanceof Signal) {
			trace('''Started building''')
			val xtEvent = mapper.convertSignal(type) as XTClassEvent
			trace('''Resolved event: «xtEvent.name»''')
			val ocd = (builder => [
						it.event = xtEvent
						it.parameter = param
					]).build
			trace('''Finished building''')
			return ocd
		}
	}
	
	override setType(Type type) {
		this.type = type
		return this
	}
	
	override setParameter(ValueDescriptor param) {
		this.param = param
		return this
	}
}