package com.incquerylabs.emdw.cpp.common

import com.ericsson.xtumlrt.oopl.OOPLType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPBasicType

class LiteralConverter {
	new() {}
	
	def String convertLiteral(OOPLType type, String literal) {
		switch type {
			CPPBasicType case type.commonType.name == "Boolean":
				return Boolean.parseBoolean(literal).toString
			CPPBasicType case type.commonType.name == "Integer":
				return Integer.parseInt(literal).toString
			CPPBasicType case type.commonType.name == "Real":
				return Double.parseDouble(literal).toString
			CPPBasicType case type.commonType.name == "String":
				return '''"«literal»"'''
			CPPBasicType case type.commonType.name == "Void":
				return "void"
//			CPPEnumType:
//				return type.
		}
		return null
	}
}