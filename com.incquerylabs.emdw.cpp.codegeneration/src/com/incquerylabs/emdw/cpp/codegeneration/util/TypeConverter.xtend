package com.incquerylabs.emdw.cpp.codegeneration.util

import org.eclipse.papyrusrt.xtumlrt.common.Type
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSequence
import com.ericsson.xtumlrt.oopl.SequenceUniquenessKind
import com.ericsson.xtumlrt.oopl.SequenceOrderednessKind

class TypeConverter {
	
	
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
	def convertSequence(CPPSequence sequence) {
		
		val orderedness = sequence.orderedness
		val uniqueness = sequence.uniqueness
		
		var cppSequenceElementType = sequence.commonType.convertType
		
		if(orderedness == SequenceOrderednessKind.UNORDERED){
			if(uniqueness == SequenceUniquenessKind.UNIQUE){
				return '''std::set<«cppSequenceElementType»>'''
			} else {
				return '''std::multiset<«cppSequenceElementType»>'''
			}
		} else {
				return '''std::vector<«cppSequenceElementType»>'''
		}
	}
	
	def convertType(Type type) {
		
		switch(type.name) {
			case "Boolean":	"bool"
			case "Integer": "int" 
			case "Real": "double"
			case "String": "std::string"
			case "UnlimitedNatural": "long"
		}
		
	}
	
}