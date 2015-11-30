package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import org.eclipse.incquery.runtime.api.IncQueryEngine

class CPPTemplate {
	
	public static val String RUNTIME_NAMESPACE = "::xumlrt"
	public static val UNIQUE_NUMBER_FQN = '''«RUNTIME_NAMESPACE»::unique_number'''
	public static val TYPE_NUMBER_FQN = '''«RUNTIME_NAMESPACE»::type_number'''
	
	// TODO @Inject
	protected val generateTracingCode = CPPTemplates.GENERATE_TRACING_CODE
	
	protected extension val CppCodeGenerationQueries codeGenQueries = CppCodeGenerationQueries.instance
	protected val IncQueryEngine engine
	
	new(IncQueryEngine engine) {
		this.engine = engine
	}
	
	def typeIdTemplate(CharSequence typeName) {
		'''
		// Type id getters
		static «UNIQUE_NUMBER_FQN» __get_static_type_number() { return «TYPE_NUMBER_FQN»<«typeName»*>::number; }
		virtual «UNIQUE_NUMBER_FQN» __get_dynamic_type_number() const { return __get_static_type_number(); }
		'''
	}
	
	protected def tracingMessage(String message) {
		
		'''
		«IF generateTracingCode»
			::std::cout << "«message»" << ::std::endl;
		«ENDIF»
		'''
	}
}
