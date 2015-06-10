package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import com.incquerylabs.emdw.cpp.codegeneration.util.TypeConverter
import org.eclipse.incquery.runtime.api.IncQueryEngine
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReferenceStorage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPRelation

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
		val cppRefStorageMatcher = codeGenQueries.getCppRelationReferenceStorage(engine)
		
		val cppRelation = cppRefStorageMatcher.getAllValuesOfcppRelation(cppClassReferenceStorage).head
		val xtAssociation = cppRelation.xtRelation
		'''
		«generateCPPReferenceStorageType(cppClassReferenceStorage)» «xtAssociation.name»;
		'''
	}
	
	def generateCPPReferenceStorageType(CPPClassReferenceStorage cppClassReferenceStorage){
		val type = cppClassReferenceStorage.type
		typeConverter.convertType(type)
	}
}