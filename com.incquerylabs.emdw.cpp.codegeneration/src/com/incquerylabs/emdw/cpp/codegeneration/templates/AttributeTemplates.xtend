package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import com.incquerylabs.emdw.cpp.codegeneration.util.TypeConverter
import org.eclipse.incquery.runtime.api.IncQueryEngine
import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute

class AttributeTemplates {
	
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
	
	def attributeDeclarationInClassHeader(CPPAttribute attribute) {
		val commonAttr = attribute.commonAttribute
		'''
		«IF commonAttr.static»static «ENDIF»«typeConverter.convertType(commonAttr.type)» «commonAttr.name»«IF commonAttr.^default != null» = «commonAttr.^default»«ENDIF»;
		'''
	}
	
}