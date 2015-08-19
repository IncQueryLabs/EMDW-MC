package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.incquerylabs.emdw.cpp.common.TypeConverter
import org.eclipse.incquery.runtime.api.IncQueryEngine

class AttributeTemplates extends CPPTemplate {
	
	val TypeConverter typeConverter
	
	val ActionCodeTemplates actionCodeTemplates
	
	new(IncQueryEngine engine) {
		super(engine)
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
