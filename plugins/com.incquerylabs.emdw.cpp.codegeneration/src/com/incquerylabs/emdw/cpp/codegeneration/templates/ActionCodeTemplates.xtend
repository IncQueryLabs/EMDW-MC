package com.incquerylabs.emdw.cpp.codegeneration.templates

import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.ActionChain
import org.eclipse.papyrusrt.xtumlrt.common.ActionCode

class ActionCodeTemplates extends CPPTemplate {
	
	new(IncQueryEngine engine) {
		super(engine)
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
			'''«action.source»'''	
		}
	}
}
