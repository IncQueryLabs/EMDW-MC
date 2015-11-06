package com.incquerylabs.emdw.cpp.common

import com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollectionImplementation
import com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementation
import com.ericsson.xtumlrt.oopl.OOPLDataType
import com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation
import com.ericsson.xtumlrt.oopl.OOPLType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPBasicType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefAssocCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefSimpleCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReference
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEnumType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEvent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPFormalParameter
import com.ericsson.xtumlrt.oopl.cppmodel.CPPParameterPassingKind
import com.ericsson.xtumlrt.oopl.cppmodel.CPPReturnValue
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSequence
import com.ericsson.xtumlrt.oopl.cppmodel.CPPStructType
import org.eclipse.emf.ecore.EObject
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.xtend.lib.annotations.Data
import com.ericsson.xtumlrt.oopl.OOPLBasicType

class TypeConverter {
	
	def String convertToType(EObject type) {
		var result = type.convertToQualifiedName
		if(type.isReferenceType){
			result = result.toPointer
		}
		if(type.isConstType){
			result = result.toConst
		}
		return result
	}
	
	/* Start of convertType dispatch method */
	def dispatch String convertToQualifiedName(CPPSequence sequence) {
		val cppContainer = sequence.cppContainer
		val elementType = sequence.elementType
		return '''«cppContainer»< «elementType.convertToType» >''' 
	}
	
	def dispatch String convertToQualifiedName(CPPClassRefSimpleCollection classReferenceSimpleCollection) {
		val cppContainer = classReferenceSimpleCollection.cppContainer
		val elementType = classReferenceSimpleCollection.ooplClass
		return '''«cppContainer»< «elementType.convertToType» >'''
	}
	
	def dispatch String convertToQualifiedName(CPPClassRefAssocCollection classReferenceAssocCollection) {
		val cppContainer = classReferenceAssocCollection.cppContainer
		val elementType = classReferenceAssocCollection.ooplClass
		return '''«cppContainer»< «elementType.convertToType» >'''
	}
	
	def dispatch String convertToQualifiedName(CPPReturnValue cppReturnValue) {
		val type = cppReturnValue.type
		return type.convertToQualifiedName
	}
	
	def dispatch String convertToQualifiedName(CPPFormalParameter parameter) {
		val type = parameter.type
		return type.convertToQualifiedName
	}
	
	def dispatch String convertToQualifiedName(CPPClassReference classReference) {
		val type = classReference.ooplClass
		return type.convertToQualifiedName
	}
	
	def dispatch String convertToQualifiedName(OOPLDataType type) {
		return type.commonType.convertToQualifiedName
	}
	
	def dispatch String convertToQualifiedName(CPPEnumType enumType) {
		return enumType.cppQualifiedName
	}
	
	def dispatch String convertToQualifiedName(CPPEvent event) {
		return '''«event.cppQualifiedName»_event'''
	}
	
	def dispatch String convertToQualifiedName(CPPClass ooplClass) {
		return ooplClass.cppQualifiedName
	}
	
	def dispatch String convertToQualifiedName(CPPStructType structType) {
		return structType.cppQualifiedName
	}
	
	def dispatch String convertToQualifiedName(CPPBasicType basicType) {
		if(basicType.cppQualifiedName != null){
			return basicType.cppQualifiedName
		}
		return basicType.cppName
	}
	
	def dispatch convertToQualifiedName(Type type) {
		switch(type.name) {
			case null: "NULL_TYPE" 
			default: type.name
		}
	}
	
	def dispatch String convertToQualifiedName(Void type) {
		return "UNKNOWN_TYPE"
	}
	/* End of convertType dispatch method */
	
	/* Start of convertBaseType dispatch method */
	def dispatch String convertToBaseType(CPPReturnValue returnValue) {
		val type = returnValue.type
		return type.convertToBaseType
	}
	
	def dispatch String convertToBaseType(CPPFormalParameter parameter) {
		val type = parameter.type
		return type.convertToBaseType
	}
	
	def dispatch String convertToBaseType(CPPClassRefSimpleCollection classReferenceSimpleCollection) {
		return classReferenceSimpleCollection.cppContainer
	}
	
	def dispatch String convertToBaseType(CPPClassRefAssocCollection classReferenceAssocCollection) {
		return classReferenceAssocCollection.cppContainer
	}
	
	def dispatch String convertToBaseType(CPPSequence sequence) {
		return sequence.cppContainer
	}
	
	def dispatch String convertToBaseType(OOPLClassRefSimpleCollectionImplementation collection) {
		return collection.containerQualifiedName
	}
	
	def dispatch String convertToBaseType(OOPLClassRefAssocCollectionImplementation collection) {
		return collection.containerQualifiedName
	}
	
	def dispatch String convertToBaseType(OOPLSequenceImplementation collection) {
		return collection.containerQualifiedName
	}
	
	def dispatch String convertToBaseType(OOPLType type) {
		return type.convertToType
	}
	/* End of convertBaseType dispatch method */
	
	def String getFullType(String baseType, Iterable<String> templateTypes) {
		'''«baseType»< «FOR templateType : templateTypes SEPARATOR ", "»«templateType»«ENDFOR» >'''
	}
	
	def isConstType(EObject type) {
		switch type {
			CPPFormalParameter case CPPParameterPassingKind.BY_CONSTANT_REFERENCE : true
			default : false
		}
	}
	
	def boolean isReferenceType(EObject type) {
		switch type {
			CPPEvent : true
			CPPClass : true
			CPPClassReference : true
			CPPFormalParameter case type.passingMode == CPPParameterPassingKind.BY_REFERENCE : true
			CPPFormalParameter case type.passingMode == CPPParameterPassingKind.BY_CONSTANT_REFERENCE : true
			CPPReturnValue : type.type.isReferenceType
			default : false
		}
	}
	
	def boolean isPrimitiveType(EObject type) {
		switch type {
			OOPLBasicType: type.commonType.name != "String" 
			default: false
		}
	}
	
	def String toConst(CharSequence type){
		'''const «type»'''
	}
	
	def String toPointer(CharSequence type) {
		'''«type»*'''
	}
	
	def String getNullPointer(){
		'''nullptr'''
	}
	
	/**
	 * Prepends the address-of operator to the provided variable, literal or operation call
	 * 
	 * @param variable - The variable, literal or operation call to which the operator should be prepended to
	 */
	def String addressOf(CharSequence variable) {
		'''(&«variable»)'''
	}
	
	/**
	 * Prepends the dereference operator to the provided pointer variable or operator which returns a pointer type
	 * 
	 * @param pointerVariable - The variable, literal or operation call to which the operator should be prepended to
	 */
	def String dereference(CharSequence pointerVariable) {
		'''(*«pointerVariable»)'''
	}
	
	
	/**
	 * Creates pointer and value representations of a variable based on it's type.
	 * 
	 * @param name - The name of the variable.
	 * @param type - The type of the variable.
	 */
	def createStringRepresentations(String name, EObject type) {
		if(type.isReferenceType) {
			return new TypeConverter.ValueAndPointerRepresentationPair(name, name.dereference)
		} else {
			return new TypeConverter.ValueAndPointerRepresentationPair(name.addressOf, name)
		}
	}
	
	/**
	 * Helper class to host the return value 
	 */
	@Data
	static class ValueAndPointerRepresentationPair {
		val String pointerRepresentation
		val String valueRepresentation
	}
	
	def getInitialValue(EObject type) {
		if(type.isPrimitiveType) {
			(type as OOPLBasicType).defaultValue
		} else if(type.isReferenceType) {
			nullPointer
		}
	}
	
}