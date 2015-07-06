package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement

class NamespaceTemplates {
	public def namespaceOpenerTemplate(CPPQualifiedNamedElement cppElement){
		val String[] namespaces = getNamespaces(cppElement)
		'''
		«FOR namespace : namespaces»
			namespace «namespace»{
		«ENDFOR»
		'''
	}
	
	public def namespaceCloserTemplate(CPPQualifiedNamedElement cppElement){
		val String[] namespaces = getNamespaces(cppElement)
		'''
		«FOR namespace : namespaces.reverseView»
			} /* namespace «namespace» */
		«ENDFOR»
		'''
	}
	
	dispatch def getNamespaces(CPPClass cppClass){
		val namespaces = cppClass.cppQualifiedName.split("::")
		return namespaces.take(namespaces.size-1).tail
	}
	
	dispatch def getNamespaces(CPPComponent cppComponent){
		val namespaces = cppComponent.cppQualifiedName.split("::")
		return namespaces.tail
	}
	
	dispatch def getNamespaces(CPPPackage cppPackage){
		val namespaces = cppPackage.cppQualifiedName.split("::")
		return namespaces.tail
	}
}