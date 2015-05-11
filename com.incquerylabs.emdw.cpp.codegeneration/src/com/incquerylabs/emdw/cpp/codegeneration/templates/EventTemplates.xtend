package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEvent
import org.eclipse.incquery.runtime.api.IncQueryEngine

class EventTemplates {

	// TODO @Inject
	val generateTracingCode = CPPTemplates.GENERATE_TRACING_CODE
	extension IncQueryEngine engine
	
	new(IncQueryEngine engine) {
		this.engine = engine
	}

	def enumInClassHeader(CPPClass cppClass) {
		val cppClassName = cppClass.xtClass.name
		'''
		enum «cppClassName»_event {
			«FOR event : cppClass.subElements.filter(CPPEvent).sortBy[xtEvent.name] SEPARATOR ","»
				«cppClassName»_EVENT_«event.xtEvent.name»
			«ENDFOR»
		};
		'''
	}
	
}