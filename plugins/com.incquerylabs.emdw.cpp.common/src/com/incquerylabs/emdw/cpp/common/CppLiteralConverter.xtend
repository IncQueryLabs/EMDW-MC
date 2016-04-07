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
package com.incquerylabs.emdw.cpp.common

import com.ericsson.xtumlrt.oopl.OOPLType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPBasicType

class CppLiteralConverter {
	new() {}
	
	/**
	 * Convert the caught literal to C++ syntax correct literal based on the type.
	 * 
	 * @param type It cannot be null and should be an instance of 
	 *             {@link com.ericsson.xtumlrt.oopl.cppmodel.CPPBasicType <em>CPPBasicType</em>} 
	 *             and its commonType's name should be one of these: Boolean, Integer, Real or String
	 * @throws IllegalArgumentException If type parameter is not supported
	 *         NumberFormatException If based on type a number should be converted but literal's string 
	 *         is not a parsable number
	 */
	def String convertLiteral(OOPLType type, String literal) throws IllegalArgumentException, NumberFormatException{
		switch type {
			CPPBasicType case type.commonType.name == "Boolean":
				return Boolean.parseBoolean(literal).toString
			CPPBasicType case type.commonType.name == "Integer":
				return Integer.parseInt(literal).toString
			CPPBasicType case type.commonType.name == "Real":
				return Double.parseDouble(literal).toString
			CPPBasicType case type.commonType.name == "String":
				return literal
		}
		throw new IllegalArgumentException("Unsupported type: "+type)
	}
}