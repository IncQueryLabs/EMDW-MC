package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile

class IncludeTemplates {
	def inclusions(CPPSourceFile cppFile){
		'''
		«cppFile.internalHeaderInclusions»
		«cppFile.externalHeaderInclusions»
		'''
	}
	
	def internalHeaderInclusions(CPPSourceFile cppFile){
		'''
		«FOR inclusion : cppFile.includedHeaders»
		#include "«inclusion.includePath»"
		«ENDFOR»
		'''
	}
	
	def externalHeaderInclusions(CPPSourceFile cppFile){
		'''
		«FOR inclusion : cppFile.externalHeaderInclusion»
		#include «inclusion.externalHeader.name» //«inclusion.comment»
		«ENDFOR»
		'''
	}
}