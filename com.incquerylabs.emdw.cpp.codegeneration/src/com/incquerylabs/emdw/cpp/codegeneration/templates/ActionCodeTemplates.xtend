package com.incquerylabs.emdw.cpp.codegeneration.templates

import org.eclipse.papyrusrt.xtumlrt.common.ActionChain
import org.eclipse.papyrusrt.xtumlrt.common.ActionCode
import org.eclipse.incquery.runtime.api.IncQueryEngine

class ActionCodeTemplates {
	
	// TODO @Inject
	val generateTracingCode = CPPTemplates.GENERATE_TRACING_CODE
	extension IncQueryEngine engine
	
	new(IncQueryEngine engine) {
		this.engine = engine
	}
	
	def generateActionCode(ActionChain actionChain) {
		if(actionChain != null){
			actionChain.actions.generateActionCode
		}
	}
	
	def generateActionCode(Iterable<ActionCode> actions) {
		'''
		«FOR action : actions»
			«action.generateActionCode»
		«ENDFOR»
		'''	
	}
	
	def generateActionCode(ActionCode action) {
		if(action?.source != null){
			'''
			/* Original «action.name» action code source: 
				«action.source»
			*/
			'''	
		}
	}
}