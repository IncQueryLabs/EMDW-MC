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
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefSimpleCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReferenceStorage
import com.incquerylabs.emdw.cpp.common.TypeConverter
import org.eclipse.incquery.runtime.api.IncQueryEngine

class AssociationTemplates extends CPPTemplate {
	val TypeConverter typeConverter
	
	val ActionCodeTemplates actionCodeTemplates
	
	new(IncQueryEngine engine) {
		super(engine)
		actionCodeTemplates = new ActionCodeTemplates(engine)
		typeConverter = new TypeConverter
	}
	
	def associationDeclarationInClassHeader(CPPClassReferenceStorage cppClassReferenceStorage) {
		val cppReferenceStorageType = generateCPPReferenceStorageType(cppClassReferenceStorage)
		val cppReferenceStorageName = cppClassReferenceStorage.cppName  
		'''
		«cppReferenceStorageType» «cppReferenceStorageName»«IF typeConverter.isReferenceType(cppClassReferenceStorage.type)» = «typeConverter.nullPointer»«ENDIF»;
		'''
	}
	
	def associationDefinitionInClassBody(CPPClassReferenceStorage cppClassReferenceStorage) {
		val cppReferenceStorageType = generateCPPReferenceStorageType(cppClassReferenceStorage)
		val cppReferenceStorageName = cppClassReferenceStorage.cppQualifiedName 
		'''
		«cppReferenceStorageType» («cppReferenceStorageName»);
		'''
	}
	
	def getQualifiedNameOfType(CPPClassReferenceStorage cppClassReferenceStorage) {
		((cppClassReferenceStorage.type as CPPClassRefSimpleCollection)?.ooplClass as CPPClass)?.cppQualifiedName
	}
	
	def generateCPPReferenceStorageType(CPPClassReferenceStorage cppClassReferenceStorage){
		val type = cppClassReferenceStorage.type
		typeConverter.convertToType(type)
	}
}
