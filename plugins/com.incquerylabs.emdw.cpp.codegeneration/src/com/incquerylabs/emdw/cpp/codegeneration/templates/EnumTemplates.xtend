package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPEnumType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEnumerator
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement

class EnumTemplates{
	
	def enumClassTemplate(String enumClassName, Iterable<String> enumeratorNames) {
		enumClassTemplate(enumClassName, enumeratorNames, enumeratorNames.head)
	}
	
	def enumClassTemplate(String enumClassName, Iterable<String> enumeratorNames, String defaultEnumeratorName) {
		if(CPPTemplates.USE_CPP11) {
			cpp11EnumClassTemplate(enumClassName, enumeratorNames, defaultEnumeratorName)
		} else {
			cpp03EnumClassTemplate(enumClassName, enumeratorNames, defaultEnumeratorName)
		}
	}
	
	def cppEnumTemplate(CPPEnumType cppEnumType){
		val enumerators = cppEnumType.enumerators.filter(CPPEnumerator)
		val enumeratorNames = enumerators.map[cppName]
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
	
	def cpp11EnumClassTemplate(String enumClassName, Iterable<String> enumeratorNames, String defaultEnumeratorName) {
		val filteredEnumeratorNames = enumeratorNames.filter[it!=defaultEnumeratorName].toList
		'''
		«IF !enumeratorNames.isNullOrEmpty»
			enum class «enumClassName» {
				«defaultEnumeratorName»,
				«FOR enumeratorName : filteredEnumeratorNames SEPARATOR ","»
					«enumeratorName»
				«ENDFOR»
			};
		«ENDIF»
		'''
	}
	
	def cpp03EnumClassTemplate(String enumClassName, Iterable<String> enumeratorNames, String defaultEnumeratorName) {
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
}
