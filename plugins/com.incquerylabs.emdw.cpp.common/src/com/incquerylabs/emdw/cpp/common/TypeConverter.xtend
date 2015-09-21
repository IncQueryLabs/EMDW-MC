package com.incquerylabs.emdw.cpp.common

import com.ericsson.xtumlrt.oopl.OOPLDataType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPBasicType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefSimpleCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReference
import com.ericsson.xtumlrt.oopl.cppmodel.CPPFormalParameter
import com.ericsson.xtumlrt.oopl.cppmodel.CPPReturnValue
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSequence
import org.eclipse.papyrusrt.xtumlrt.common.Type
import com.ericsson.xtumlrt.oopl.cppmodel.CPPParameterPassingKind
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEnumType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPStructType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEvent
import com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementation

class TypeConverter {
	
	def dispatch String convertType(CPPReturnValue cppReturnValue) {
		val type = cppReturnValue.type
		return convertType(type);
	}
	
	def dispatch String convertType(CPPFormalParameter parameter) {
		val type = parameter.type
		var convertedType = convertType(type);
		if(!(type instanceof CPPClassReference)){
			switch parameter.passingMode {
				case CPPParameterPassingKind.BY_REFERENCE : convertedType = '''«convertedType»*'''
				case CPPParameterPassingKind.BY_CONSTANT_REFERENCE : convertedType = '''const «convertedType»*'''
				case CPPParameterPassingKind.BY_VALUE : convertedType = convertedType
			}
		}
		
		return convertedType
	}
	
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
	
	def dispatch String convertType(OOPLClassRefSimpleCollectionImplementation collection, CPPQualifiedNamedElement elementType) {
		val cppContainer = collection.containerQualifiedName
		val cppType = elementType.convertType
		return '''«cppContainer»< «cppType»* >''' 
	}
	
	def dispatch String convertType(OOPLSequenceImplementation collection, CPPQualifiedNamedElement elementType) {
		val cppContainer = collection.containerQualifiedName
		val cppType = elementType.convertType
		return '''«cppContainer»< «cppType» >''' 
	}
	
	def dispatch String convertType(CPPBasicType basicType) {
		if(basicType.cppQualifiedName != null){
			return basicType.cppQualifiedName
		}
		return basicType.cppName
	}
	
	def dispatch String convertType(CPPEnumType enumType) {
		return enumType.cppQualifiedName
	}
	
	def dispatch String convertType(CPPStructType structType) {
		return structType.cppQualifiedName
	}
	
	def dispatch String convertType(OOPLDataType type) {
		return convertType(type.commonType)
	}
	
	def dispatch String convertType(CPPClass ooplClass) {
		return ooplClass.cppQualifiedName
	}
	
	def dispatch String convertType(CPPEvent event) {
		return event.cppQualifiedName
	}
	
	def dispatch convertType(Type type) {
		switch(type.name) {
			case null: "NULL_TYPE" 
			default: type.name
		}
	}
	
	def dispatch String convertType(Void type) {
		return "UNKNOWN_TYPE"
	}
}