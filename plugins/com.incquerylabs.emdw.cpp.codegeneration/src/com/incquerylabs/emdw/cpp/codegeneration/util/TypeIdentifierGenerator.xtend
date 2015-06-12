package com.incquerylabs.emdw.cpp.codegeneration.util

class TypeIdentifierGenerator {
	
	var short nextTypeId = 1 as short
	
	def synchronized generateTypeId() {
		val typeId = nextTypeId
		if(nextTypeId >= Short.MAX_VALUE){
			throw new IllegalStateException("Cannot generate any more type IDs!")
		}
		nextTypeId++
		return typeId
	}
	
}