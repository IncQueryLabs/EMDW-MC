/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Peter Lunk - initial API and implementation
 *******************************************************************************/
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