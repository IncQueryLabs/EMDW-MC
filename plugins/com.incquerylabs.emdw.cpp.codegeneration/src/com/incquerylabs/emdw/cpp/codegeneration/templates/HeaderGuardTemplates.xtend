package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement

class HeaderGuardTemplates {
	def startHeaderGuard(CPPQualifiedNamedElement cppQualifiedNamedElement, CharSequence postfix){
		'''
		#ifndef «getHeaderGuardString(cppQualifiedNamedElement, postfix)»
		#define «getHeaderGuardString(cppQualifiedNamedElement, postfix)»
		'''
	}
	
	def closeHeaderGuard(CPPQualifiedNamedElement cppQualifiedNamedElement, CharSequence postfix){
		'''#endif /* «getHeaderGuardString(cppQualifiedNamedElement, postfix)» */'''
	}
	
	def getHeaderGuardString(CPPQualifiedNamedElement cppQualifiedNamedElement, CharSequence postfix){
		'''«cppQualifiedNamedElement.cppQualifiedName.toUpperCase.replace(":","_")»_«postfix»'''
	}
}