package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.incquerylabs.emdw.cpp.common.TypeConverter
import org.eclipse.incquery.runtime.api.IncQueryEngine
import com.ericsson.xtumlrt.oopl.OOPLBasicType

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
		// TODO: refactor to method
		val initializer = '''«IF commonAttr.^default != null» = «commonAttr.^default»«ELSEIF typeConverter.isPrimitiveType(attribute.type)» = «(attribute.type as OOPLBasicType).defaultValue»«ENDIF»'''
		'''
		«IF commonAttr.static»static «ENDIF»«generateCPPAttributeType(attribute)» «attribute.cppName»«initializer»;
		'''
	}
	
	def generateCPPAttributeType(CPPAttribute attribute){
		val type = attribute.type
		typeConverter.convertToType(type)
	}
}
