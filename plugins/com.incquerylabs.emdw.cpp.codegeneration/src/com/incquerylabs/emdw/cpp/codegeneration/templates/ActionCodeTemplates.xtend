package com.incquerylabs.emdw.cpp.codegeneration.templates

import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.ActionChain
import org.eclipse.papyrusrt.xtumlrt.common.ActionCode
import org.eclipse.papyrusrt.xtumlrt.common.ActionReference

class ActionCodeTemplates extends CPPTemplate {
	
	new(IncQueryEngine engine) {
		super(engine)
	}
	
	def dispatch CharSequence generateActionCode(Void noAction) {
		'''''' // No Action
	}
	
	def dispatch CharSequence generateActionCode(ActionChain actionChain) {
		if(actionChain != null){
			actionChain.actions.generateActionCode
		}
	}
	
	def dispatch CharSequence generateActionCode(Iterable<ActionCode> actions) {
		'''
		«FOR action : actions»
			«action.generateActionCode»
		«ENDFOR»
		'''	
	}
	
	def dispatch CharSequence generateActionCode(ActionCode action) {
		if(action?.source != null){
			'''«action.source»'''	
		}
	}
	
	def dispatch CharSequence generateActionCode(ActionReference action) {
		if(action?.target != null){
			action.target.generateActionCode	
		}
	}
}
