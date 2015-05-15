package com.incquerylabs.emdw.cpp.codegeneration.util

import org.eclipse.papyrusrt.xtumlrt.common.Type

class TypeConverter {
	
	def convertType(Type type){
		
		switch(type.name){
			case "Boolean":	"bool"
			case "Integer": "int" 
			case "Real": "double"
			case "String": "std::string"
			case "UnlimitedNatural": "long"
		}
		
	}
	
}