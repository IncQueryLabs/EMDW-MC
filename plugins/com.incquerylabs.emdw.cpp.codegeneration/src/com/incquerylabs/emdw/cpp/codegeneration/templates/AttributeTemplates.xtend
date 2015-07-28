package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import com.incquerylabs.emdw.cpp.common.TypeConverter
import org.eclipse.incquery.runtime.api.IncQueryEngine
import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSequence

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
		«IF commonAttr.static»static «ENDIF»«generateCPPAttributeType(attribute)» «attribute.cppName»«IF commonAttr.^default != null» = «commonAttr.^default»«ENDIF»;
		'''
	}
	
	def generateCPPAttributeType(CPPAttribute attribute){
		val type = attribute.type
		typeConverter.convertType(type)
	}
	
}