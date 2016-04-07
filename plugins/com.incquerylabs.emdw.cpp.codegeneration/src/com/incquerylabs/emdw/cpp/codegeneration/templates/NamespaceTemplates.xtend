/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.ericsson.xtumlrt.oopl.cppmodel.CPPExternalBridge

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
	
	dispatch def getNamespaces(CPPExternalBridge cppExternalBridge){
		val namespaces = cppExternalBridge.cppQualifiedName.split("::")
		return namespaces.tail
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