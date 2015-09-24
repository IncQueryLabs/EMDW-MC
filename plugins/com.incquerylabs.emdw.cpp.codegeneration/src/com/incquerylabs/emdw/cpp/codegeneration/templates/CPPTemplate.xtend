package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import org.eclipse.incquery.runtime.api.IncQueryEngine

class CPPTemplate {
	
	public static val String RUNTIME_NAMESPACE = "::xumlrt"
	
	// TODO @Inject
	protected val generateTracingCode = CPPTemplates.GENERATE_TRACING_CODE
	
	protected extension val CppCodeGenerationQueries codeGenQueries = CppCodeGenerationQueries.instance
	protected val IncQueryEngine engine
	
	new(IncQueryEngine engine) {
		this.engine = engine
	}
	
	protected def tracingMessage(String message) {
		
		'''
		«IF generateTracingCode»
			::std::cout << "«message»" << ::std::endl;
		«ENDIF»
		'''
	}
}
