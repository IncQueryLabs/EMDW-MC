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
		«cppReferenceStorageType» «cppReferenceStorageName»;
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
