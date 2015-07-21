package com.incquerylabs.emdw.snippettemplate.serializer

import org.eclipse.emf.ecore.EObject
import snippetTemplate.CompositeSnippet
import snippetTemplate.StringSnippet

class ReducedAlfSnippetTemplateSerializer {
	def dispatch String compile(EObject o) {
		'''«FOR c : o.eContents»«c.compile»«ENDFOR»'''
	}
    
    def dispatch String compile(StringSnippet s){
    	'''«s.value»'''
	}
	
    def dispatch String compile(CompositeSnippet f){
    	'''«FOR fragment : f.snippet»«fragment.compile»«ENDFOR»'''
	}
}