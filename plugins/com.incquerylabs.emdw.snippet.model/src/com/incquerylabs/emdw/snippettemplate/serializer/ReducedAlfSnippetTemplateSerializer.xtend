package com.incquerylabs.emdw.snippettemplate.serializer

import com.incquerylabs.emdw.snippettemplate.CompositeSnippet
import com.incquerylabs.emdw.snippettemplate.StringSnippet
import org.eclipse.emf.ecore.EObject

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