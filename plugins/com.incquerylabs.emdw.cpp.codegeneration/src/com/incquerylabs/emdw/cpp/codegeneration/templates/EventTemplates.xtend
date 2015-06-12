package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEvent
import org.eclipse.incquery.runtime.api.IncQueryEngine

class EventTemplates {

	// TODO @Inject
	val generateTracingCode = CPPTemplates.GENERATE_TRACING_CODE
	val IncQueryEngine engine
	
	new(IncQueryEngine engine) {
		this.engine = engine
	}

	def enumInClassHeader(CPPClass cppClass) {
		val cppClassName = cppClass.cppName
		'''
		enum «cppClassName»_event {
			«FOR event : cppClass.subElements.filter(CPPEvent).sortBy[cppName] SEPARATOR ","»
				«cppClassName»_EVENT_«event.cppName»
			«ENDFOR»
		};
		'''
	}
	
}