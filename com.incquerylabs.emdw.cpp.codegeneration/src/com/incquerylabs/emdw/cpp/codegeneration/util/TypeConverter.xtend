package com.incquerylabs.emdw.cpp.codegeneration.util

import com.ericsson.xtumlrt.oopl.OOPLType
import com.ericsson.xtumlrt.oopl.SequenceOrderednessKind
import com.ericsson.xtumlrt.oopl.SequenceUniquenessKind
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefSimpleCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReference
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSequence
import org.eclipse.papyrusrt.xtumlrt.common.Type

class TypeConverter {
	
	def dispatch String convertType(CPPClassReference classReference){
		return '''«classReference.cppQualifiedName»*'''
	}
	
	def dispatch String convertType(CPPClassRefSimpleCollection classReferenceSimpleCollection){
		return '''«classReferenceSimpleCollection.cppContainer»< «classReferenceSimpleCollection.cppQualifiedName»* >'''
	}
	
	def dispatch String convertType(OOPLType type) {
		return convertType(type.commonType)
	}
	
	def dispatch String convertType(CPPSequence sequence) {
		val orderedness = sequence.orderedness
		val uniqueness = sequence.uniqueness
		
		var cppSequenceElementType = sequence.elementType.convertType
		// TODO: Use CPPSequence.cppContainer derived feature when implemented
		if(orderedness == SequenceOrderednessKind.UNORDERED){
			if(uniqueness == SequenceUniquenessKind.UNIQUE){
				return '''std::set< «cppSequenceElementType» >'''
			} else {
				return '''std::multiset< «cppSequenceElementType» >'''
			}
		} else {
				return '''std::vector< «cppSequenceElementType» >'''
		}
	}
	
	def dispatch convertType(Type type) {
		if(type == null){
			// TODO should return UNKNOWN_TYPE if Operation.returnType is correctly set to Void
			return "void"
		}
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
	/*
		{
			!CPPFeatures.unorderedAssociativeContainers;
			cppSequence.orderedness==SequenceOrderednessKind==UNORDERED;
			cppSequence.uniqueness==SequenceOrderednessKind==NON_UNIQUE;
			cppClassRefSimpleCollection.cppContainer=="std::multiset";
		} or {
			CPPFeatures.unorderedAssociativeContainers;
			cppSequence.orderedness==SequenceOrderednessKind==UNORDERED;
			cppSequence.uniqueness==SequenceOrderednessKind==NON_UNIQUE;
			cppClassRefSimpleCollection.cppContainer=="std::unordered_multiset";
		{
			!CPPFeatures.unorderedAssociativeContainers;
			cppSequence.orderedness==SequenceOrderednessKind==UNORDERED;
			cppSequence.uniqueness==SequenceOrderednessKind==UNIQUE;
			cppClassRefSimpleCollection.cppContainer=="std::set";
		} or {
			CPPFeatures.unorderedAssociativeContainers;
			cppSequence.orderedness==SequenceOrderednessKind==UNORDERED;
			cppSequence.uniqueness==SequenceOrderednessKind==UNIQUE;
			cppClassRefSimpleCollection.cppContainer=="std::unordered_set";
		} or {
			cppSequence.orderedness==SequenceOrderednessKind==ORDERED;
			cppClassRefSimpleCollection.cppContainer=="std::vector";
		}
	 */
	
}