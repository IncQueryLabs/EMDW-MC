package com.incquerylabs.emdw.cpp.codegeneration.templates

class EnumTemplates{
	def enumClassTemplate(CharSequence enumClassName, Iterable<CharSequence> enumeratorNames) {
		'''
		«IF !enumeratorNames.isNullOrEmpty»
			class «enumClassName» {
			public:
				enum __val_type {
					«FOR enumeratorName : enumeratorNames SEPARATOR ","»
						«enumeratorName»
					«ENDFOR»
				};
				«enumClassName»(): __val(«enumeratorNames.head») {}
				«enumClassName»(__val_type v): __val(v) {}
				operator __val_type() const { return __val; }
			private:
				__val_type __val;
			};
		«ENDIF»
		'''
	}
}