package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import org.eclipse.incquery.runtime.api.IncQueryEngine
import com.incquerylabs.emdw.cpp.codegeneration.util.TypeIdentifierGenerator

class CPPTemplates {
	
	public static boolean GENERATE_TRACING_CODE = true
	
	// TODO @Inject
	boolean generateTracingCode = GENERATE_TRACING_CODE
	val IncQueryEngine engine
	val ClassTemplates classTemplates
	val TypeIdentifierGenerator typeIdGenerator
	
	new(IncQueryEngine engine) {
		this.engine = engine
		typeIdGenerator = new TypeIdentifierGenerator
		classTemplates = new ClassTemplates(engine, typeIdGenerator)
	}
	
	def classHeaderTemplate(CPPClass cppClass) {
		classTemplates.classHeaderTemplate(cppClass)
	}
	
	def classBodyTemplate(CPPClass cppClass) {
		classTemplates.classBodyTemplate(cppClass)
	}
	
}