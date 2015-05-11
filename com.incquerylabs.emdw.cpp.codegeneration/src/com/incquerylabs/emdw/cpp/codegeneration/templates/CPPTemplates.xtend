package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import org.eclipse.incquery.runtime.api.IncQueryEngine

class CPPTemplates {
	
	public static val GENERATE_TRACING_CODE = true
	
	// TODO @Inject
	val generateTracingCode = GENERATE_TRACING_CODE
	val IncQueryEngine engine
	val ClassTemplates classTemplates
	
	new(IncQueryEngine engine) {
		this.engine = engine
		classTemplates = new ClassTemplates(engine)
	}
	
	def classHeaderTemplate(CPPClass cppClass) {
		classTemplates.classHeaderTemplate(cppClass)
	}
	
	def classBodyTemplate(CPPClass cppClass) {
		classTemplates.classBodyTemplate(cppClass)
	}
	
}