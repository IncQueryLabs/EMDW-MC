package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.ericsson.xtumlrt.oopl.cppmodel.CPPHeaderFile

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
		#include "«getRelativeIncludePath(cppFile, inclusion)»"
		«ENDFOR»
		'''
	}
	
	def getRelativeIncludePath(CPPSourceFile cppFile, CPPHeaderFile cppHeader) {
		val ownDirectories = cppFile.generationDirectory.split("/")
		val includeDirectories = cppHeader.includeDirectory.split("/")
		val minimalSize = Math.min(ownDirectories.size, includeDirectories.size)
		var int sameParentCount = 0
		
		while(sameParentCount<minimalSize && ownDirectories.get(sameParentCount) == includeDirectories.get(sameParentCount)){
			sameParentCount++
		}
		val parentPrefix = '''«FOR i : sameParentCount..<ownDirectories.size»../«ENDFOR»'''
		val includePrefix = '''«FOR i: sameParentCount..<includeDirectories.size»«includeDirectories.get(i)»/«ENDFOR»'''
		return '''«parentPrefix»«includePrefix»«cppHeader.includeName»'''
	}
	
	def externalHeaderInclusions(CPPSourceFile cppFile){
		'''
		«FOR inclusion : cppFile.externalHeaderInclusion»
		#include "«inclusion.externalHeader.name»"
		«ENDFOR»
		'''
	}
}