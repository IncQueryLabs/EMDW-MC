package com.incquerylabs.uml.ralf.api.impl;

import java.util.Map;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.uml2.uml.OpaqueBehavior;

import com.google.common.collect.Maps;
import com.incquerylabs.uml.ralf.api.IReducedAlfGenerator;
import com.incquerylabs.uml.ralf.api.IReducedAlfParser;
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider;
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfSnippetTemplateCompiler;

import snippetTemplate.Snippet;

public class ReducedAlfGenerator implements IReducedAlfGenerator {
      
    private ReducedAlfSnippetTemplateCompiler templateCompiler;
    
    private Map<Snippet, String> snippetMap;
    
    public ReducedAlfGenerator() {
        snippetMap = Maps.newHashMap();
        templateCompiler = new ReducedAlfSnippetTemplateCompiler();
    }

    @Override
    public Snippet createSnippet(OpaqueBehavior behavior, IReducedAlfParser parser) throws SnippetCompilerException {
        ParsingResults result = parser.parse(behavior);
        return createSnippet(result);
    }
    
    @Override
    public Snippet createSnippet(String behavior, IUMLContextProvider contextProvider, IReducedAlfParser parser) throws SnippetCompilerException {
    	ParsingResults result = parser.parse(behavior, contextProvider);
    	return createSnippet(result);
    }
    @Override
    public Snippet createSnippet(String behavior, IReducedAlfParser parser) throws SnippetCompilerException {
        ParsingResults result = parser.parse(behavior);
        return createSnippet(result);
    }

    @Override
    public Snippet createSnippet(ParsingResults result) throws SnippetCompilerException {
        if(result.validationOK()){
            return createSnippet(result.getModel());
        }
        throw new SnippetCompilerException("Validation: "+result.toString());
    }
    
    private Snippet createSnippet(EObject actionCode) {
        return templateCompiler.visit(actionCode);
    }

}
