package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPStructMember
import com.ericsson.xtumlrt.oopl.cppmodel.CPPStructType
import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement

class StructTemplates {
	extension val TypeConverter typeConverter
	
	new() {
		typeConverter = new TypeConverter
	}
	
	def cppStructTemplate(CPPStructType cppStructType) {
		val structMembers = cppStructType.members.filter(CPPStructMember)
		'''
		struct «cppStructType.cppName» {
			«FOR structMember : structMembers»
				«structMember.type.convertType» «structMember.cppName»;
			«ENDFOR»
		};
		'''
	}
	
	def cppStructInContainer(CPPQualifiedNamedElement cppContainer) {
		'''
		«FOR cppStructType : cppContainer.subElements.filter(CPPStructType)»
			«cppStructType.cppStructTemplate»
		«ENDFOR»
		'''
	}
}