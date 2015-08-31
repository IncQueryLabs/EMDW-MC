package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPEnumType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEnumerator
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement

class EnumTemplates{
	def enumClassTemplate(CharSequence enumClassName, Iterable<CharSequence> enumeratorNames) {
		enumClassTemplate(enumClassName, enumeratorNames, enumeratorNames.head)
	}
	def enumClassTemplate(CharSequence enumClassName, Iterable<CharSequence> enumeratorNames, CharSequence defaultEnumeratorName) {
		'''
		«IF !enumeratorNames.isNullOrEmpty»
			class «enumClassName» {
			public:
				enum __val_type {
					«FOR enumeratorName : enumeratorNames SEPARATOR ","»
						«enumeratorName»
					«ENDFOR»
				};
				«enumClassName»(): __val(«defaultEnumeratorName») {}
				«enumClassName»(__val_type v): __val(v) {}
				operator __val_type() const { return __val; }
			private:
				__val_type __val;
			};
		«ENDIF»
		'''
	}
	
	def cppEnumTemplate(CPPEnumType cppEnumType){
		val enumerators = cppEnumType.enumerators.filter(CPPEnumerator)
		val enumeratorNames = enumerators.map[cppName as CharSequence]
		val defaultEnumerator = cppEnumType.defaultValue as CPPEnumerator
		if(defaultEnumerator == null){
			return enumClassTemplate(cppEnumType.cppName, enumeratorNames)
		}
		val defaultEnumeratorName = defaultEnumerator.cppName
		return enumClassTemplate(cppEnumType.cppName, enumeratorNames, defaultEnumeratorName)
	}
	
	def cppEnumsInContainer(CPPQualifiedNamedElement cppContainer) {
		'''
		«FOR cppEnumType : cppContainer.subElements.filter(CPPEnumType)»
			«cppEnumType.cppEnumTemplate»
		«ENDFOR»
		'''
	}
}