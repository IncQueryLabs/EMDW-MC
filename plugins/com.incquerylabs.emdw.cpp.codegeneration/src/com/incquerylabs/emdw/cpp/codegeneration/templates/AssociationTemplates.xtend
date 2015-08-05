package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import com.incquerylabs.emdw.cpp.common.TypeConverter
import org.eclipse.incquery.runtime.api.IncQueryEngine
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReferenceStorage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefSimpleCollection

class AssociationTemplates {
	val codeGenQueries = CppCodeGenerationQueries.instance
	val TypeConverter typeConverter
	
	// TODO @Inject
	val generateTracingCode = CPPTemplates.GENERATE_TRACING_CODE
	val ActionCodeTemplates actionCodeTemplates
	val IncQueryEngine engine
	
	new(IncQueryEngine engine) {
		this.engine = engine
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
		typeConverter.convertType(type)
	}
}