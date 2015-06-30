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
		val classEvents = cppClass.subElements.filter(CPPEvent).sortBy[cppName]
		'''
		enum «cppClassName»_event {
			«FOR event : classEvents SEPARATOR ","»
				«cppClassName»_EVENT_«event.cppName»
			«ENDFOR»
		};
		'''
	}
	
	def innerClassesInClassHeader(CPPClass cppClass) {
		val classEvents = cppClass.subElements.filter(CPPEvent).sortBy[cppName]
		'''
		«FOR event : classEvents»
			class «event.cppName»Event : public Event {
				public:
					«event.cppName»Event(bool isInternal);
			};
		«ENDFOR»
		'''
	}
	
	def innerClassesInClassBody(CPPClass cppClass) {
		val cppClassName = cppClass.cppName
		val classEvents = cppClass.subElements.filter(CPPEvent).sortBy[cppName]
		'''
		«FOR event : classEvents»
			«event.cppQualifiedName»Event::«event.cppName»Event(bool isInternal) : 
				Event(«cppClassName»_EVENT_«event.cppName», isInternal){
			}
		«ENDFOR»
		'''
	}
}