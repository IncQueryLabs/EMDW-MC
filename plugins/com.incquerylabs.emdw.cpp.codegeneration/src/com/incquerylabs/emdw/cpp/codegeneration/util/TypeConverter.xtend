package com.incquerylabs.emdw.cpp.codegeneration.util

import com.ericsson.xtumlrt.oopl.OOPLDataType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefSimpleCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReference
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSequence
import org.eclipse.papyrusrt.xtumlrt.common.Type

class TypeConverter {
	
	def dispatch String convertType(CPPClassReference classReference){
		val cppType = convertType(classReference.ooplClass)
		return '''«cppType»*'''
	}
	
	def dispatch String convertType(CPPClassRefSimpleCollection classReferenceSimpleCollection){
		val cppContainer = classReferenceSimpleCollection.cppContainer
		val cppType = convertType(classReferenceSimpleCollection.ooplClass)
		return '''«cppContainer»< «cppType»* >'''
	}
	
	def dispatch String convertType(CPPSequence sequence) {
		val cppContainer = sequence.cppContainer
		val cppType = convertType(sequence.elementType)
		return '''«cppContainer»< «cppType» >''' 
	}
	
	def dispatch String convertType(OOPLDataType type) {
		return convertType(type.commonType)
	}
	
	def dispatch String convertType(CPPClass ooplClass) {
		return ooplClass.cppQualifiedName
	}
	
	def dispatch convertType(Type type) {
		switch(type.name) {
			case null: "NULL_TYPE" 
			case "Boolean":	"bool"
			case "Integer": "long" 
			case "Real": "double"
			case "String": "std::string"
			case "Void": "void"
			default: type.name
		}
	}
	
	def dispatch String convertType(Void type) {
		return "UNKNOWN_TYPE"
	}
}