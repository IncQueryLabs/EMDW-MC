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

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplStaticOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlStaticOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.cpp.common.util.UmlTypedValueDescriptor
import com.incquerylabs.emdw.cpp.common.util.XtTypedValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Operation
import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor

class UmlStaticOperationCallBuilder implements IUmlStaticOperationCallBuilder {
	extension Logger logger = Logger.getLogger(class)
	
	private UmlToXtumlMapper mapper
	private IOoplStaticOperationCallBuilder builder
	
	private Operation operation
	private List<UmlTypedValueDescriptor<? extends ValueDescriptor>> params = #[]
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppStaticOperationCallBuilder(engine)
	}
	
	override build() {
		trace('''Started building''')
		var OperationCallDescriptor ocd = null
		val xtParams = params.map[new XtTypedValueDescriptor(mapper.convertType(type), descriptor)]
		if(operation.qualifiedName.contains("std::out::println")) {
			ocd = (builder => [
					it.operationName = "println"
					it.parameters = xtParams
				]).build
		} else if(operation.qualifiedName.contains("std::boolean::toString") ||
			operation.qualifiedName.contains("std::real::toString") ||
			operation.qualifiedName.contains("std::int::toString")
		) {
			ocd = (builder => [
					it.operationName = "toString"
					it.parameters = xtParams
				]).build
		} else {
			val xtOperation = mapper.convertOperation(operation)
			trace('''Resolved operation: «xtOperation.name»''')
			ocd = (builder => [
						it.operation = xtOperation
						it.parameters = xtParams
					]).build
		}
		trace('''Finished building''')
		return ocd
	}
	
	override setOperation(Operation operation) {
		this.operation = operation
		return this
	}
	
	override setParameters(UmlTypedValueDescriptor<? extends ValueDescriptor>... params) {
		this.params = params
		return this
	}
	
}