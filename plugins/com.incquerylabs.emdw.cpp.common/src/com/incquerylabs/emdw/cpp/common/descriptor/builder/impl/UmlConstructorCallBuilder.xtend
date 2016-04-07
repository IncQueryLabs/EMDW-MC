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

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.cpp.common.util.UmlTypedValueDescriptor
import com.incquerylabs.emdw.cpp.common.util.XtTypedValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.Signal
import org.eclipse.uml2.uml.Type
import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor

class UmlConstructorCallBuilder implements IUmlConstructorCallBuilder {
	extension Logger logger = Logger.getLogger(class)
	
	private UmlToXtumlMapper mapper
	private IOoplConstructorCallBuilder builder
	
	private Type type
	private List<UmlTypedValueDescriptor<? extends ValueDescriptor>> params
	private Operation operation
	
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppConstructorCallBuilder(engine)
	}
	
	
	override build() {
		trace('''Started building''')
		val xtParams = params?.map[new XtTypedValueDescriptor(mapper.convertType(type), descriptor)]
		
		var OperationCallDescriptor ocd = null
		if(type instanceof Signal) {
			val xtEvent = mapper.convertSignal(type) as XTClassEvent
			trace('''Resolved event: «xtEvent.name»''')
			ocd = (builder => [
						it.redefinableElement = xtEvent
						it.parameters = xtParams
					]).build
		} else {
			val xtClass = mapper.convertType(type) as XTClass
			trace('''Resolved class: «xtClass.name»''')
			val xtOperation = if(operation != null) mapper.convertOperation(operation) else null
			ocd = (builder => [
						it.redefinableElement = xtClass
						it.parameters = xtParams
						it.operation = xtOperation
					]).build
		}
		trace('''Finished building''')
		return ocd
	}
	
	override setType(Type type) {
		this.type = type
		return this
	}
	
	override setParameters(UmlTypedValueDescriptor<? extends ValueDescriptor>... params) {
		this.params = params
		return this
	}
	
	override setOperation(Operation operation) {
		this.operation = operation
		this
	}
	
}