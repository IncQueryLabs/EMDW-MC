/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.incquerylabs.emdw.cpp.common.TypeConverter
import org.eclipse.incquery.runtime.api.IncQueryEngine
import com.ericsson.xtumlrt.oopl.OOPLBasicType

class AttributeTemplates extends CPPTemplate {
	
	val TypeConverter typeConverter
	
	val ActionCodeTemplates actionCodeTemplates
	
	new(IncQueryEngine engine) {
		super(engine)
		actionCodeTemplates = new ActionCodeTemplates(engine)
		typeConverter = new TypeConverter
	}
	
	def attributeDeclarationInClassHeader(CPPAttribute attribute) {
		val commonAttr = attribute.commonAttribute
		// TODO: refactor to method
		val initializer = '''«IF commonAttr.^default != null» = «commonAttr.^default»«ELSEIF typeConverter.isPrimitiveType(attribute.type)» = «(attribute.type as OOPLBasicType).defaultValue»«ENDIF»'''
		'''
		«IF commonAttr.static»static «ENDIF»«generateCPPAttributeType(attribute)» «attribute.cppName»«initializer»;
		'''
	}
	
	def generateCPPAttributeType(CPPAttribute attribute){
		val type = attribute.type
		typeConverter.convertToType(type)
	}
}
