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