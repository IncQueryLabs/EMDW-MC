package com.incquerylabs.uml.ralf.api.impl;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.uml2.uml.OpaqueBehavior;

import com.incquerylabs.uml.ralf.api.IReducedAlfGenerator;
import com.incquerylabs.uml.ralf.api.IReducedAlfParser;
import com.incquerylabs.uml.ralf.api.impl.ParsingResults;
import com.incquerylabs.uml.ralf.api.impl.SnippetCompilerException;
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider;
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfSnippetTemplateCompiler;

import snippetTemplate.Snippet;

public class ReducedAlfGenerator implements IReducedAlfGenerator {
      

    @Override
    public Snippet createSnippet(OpaqueBehavior behavior, IReducedAlfParser parser, ReducedAlfSnippetTemplateCompiler templateCompiler) throws SnippetCompilerException {
        ParsingResults result = parser.parse(behavior);
        return createSnippet(result, templateCompiler);
    }
    
    @Override
    public Snippet createSnippet(String behavior, IUMLContextProvider contextProvider, IReducedAlfParser parser, ReducedAlfSnippetTemplateCompiler templateCompiler) throws SnippetCompilerException {
    	ParsingResults result = parser.parse(behavior, contextProvider);
    	return createSnippet(result, templateCompiler);
    }
    @Override
    public Snippet createSnippet(String behavior, IReducedAlfParser parser, ReducedAlfSnippetTemplateCompiler templateCompiler) throws SnippetCompilerException {
        ParsingResults result = parser.parse(behavior);
        return createSnippet(result, templateCompiler);
    }

    @Override
    public Snippet createSnippet(ParsingResults result, ReducedAlfSnippetTemplateCompiler templateCompiler) throws SnippetCompilerException {
        if(result.validationOK()){
            return createSnippet(result.getModel(), templateCompiler);
        }
        throw new SnippetCompilerException("Validation: "+result.toString());
    }
    
    private Snippet createSnippet(EObject actionCode, ReducedAlfSnippetTemplateCompiler templateCompiler) {
        return templateCompiler.visit(actionCode);
    }

}
