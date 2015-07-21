package com.incquerylabs.emdw.snippettemplate.serializer

import org.eclipse.emf.ecore.EObject
import snippetTemplate.CompositeSnippet
import snippetTemplate.StringSnippet

class ReducedAlfSnippetTemplateSerializer {
	def dispatch String serialize(EObject o) {
		'''«FOR c : o.eContents»«c.serialize»«ENDFOR»'''
	}
    
    def dispatch String serialize(StringSnippet s){
    	'''«s.value»'''
	}
	
    def dispatch String serialize(CompositeSnippet f){
    	'''«FOR fragment : f.snippet»«fragment.serialize»«ENDFOR»'''
	}
}