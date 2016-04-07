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

import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplCopyConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent

class CppCopyConstructorCallBuilder implements IOoplCopyConstructorCallBuilder {
	extension Logger logger = Logger.getLogger(class)
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private XtumlToOoplMapper mapper
	extension TypeConverter converter
	
	private XTClassEvent re
	private ValueDescriptor param
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new XtumlToOoplMapper(engine)
		converter = new TypeConverter
	}
	
	override build() {
		trace('''Started building''')
		var ocd = factory.createOperationCallDescriptor
		val cppEvent = mapper.convertEvent(re)
		trace('''Resolved event: «cppEvent.cppQualifiedName»''')
		ocd.baseType = cppEvent.convertToType
		ocd.stringRepresentation = '''«IF param!=null»«param.stringRepresentation»->clone()«ENDIF»'''
		ocd.fullType = ocd.baseType
		trace('''Finished building''')
		return ocd
	}
	
	override setEvent(XTClassEvent event) {
		this.re = re
		return this
	}
	
	override setParameter(ValueDescriptor param) {
		this.param = param
		return this
	}
	
}