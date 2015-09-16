package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.incquerylabs.emdw.snippettemplate.Snippet
import com.incquerylabs.emdw.snippettemplate.serializer.ReducedAlfSnippetTemplateSerializer
import org.eclipse.incquery.runtime.api.IncQueryEngine

class ActionCodeTemplates extends CPPTemplate {
	extension val ReducedAlfSnippetTemplateSerializer ralfSerializer = new ReducedAlfSnippetTemplateSerializer
	
	new(IncQueryEngine engine) {
		super(engine)
	}
	
	def CharSequence generateActionCode(Snippet snippet) {
		snippet.serialize
	}
}
