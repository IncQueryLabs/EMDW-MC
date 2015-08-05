package com.incquerylabs.emdw.cpp.common

import com.ericsson.xtumlrt.oopl.OOPLType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPBasicType

class CPPLiteralConverter {
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
				return '''"«literal»"'''
		}
		throw new IllegalArgumentException("Unsupported type: "+type)
	}
}