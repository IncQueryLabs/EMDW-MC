package com.incquerylabs.uml.ralf.api.impl;

import java.util.Map;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.uml2.uml.OpaqueBehavior;

import com.google.common.collect.Maps;
import com.google.inject.Inject;
import com.incquerylabs.uml.ralf.api.IParserAPI;
import com.incquerylabs.uml.ralf.api.ISnippetCompilerAPI;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements;
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfSnippetCompiler;

public class SnippetCompilerAPI implements ISnippetCompilerAPI {
      
    private ReducedAlfSnippetCompiler snippetCompiler;
    
    private Map<String, String> snippetMap;
    
    @Inject
    public SnippetCompilerAPI() {
        snippetMap = Maps.newHashMap();
        snippetCompiler = new ReducedAlfSnippetCompiler();
    }

    @Override
    public Map<String, String> getSnippetMap() {
        return snippetMap;
    }

    @Override
    public String createSnippet(OpaqueBehavior behavior, IParserAPI parser) {
        Statements statements = parser.parse(behavior);
        return createSnippet(statements);
    }
    
    @Override
    public String createSnippet(String behavior, IParserAPI parser) {
        Statements statements = parser.parse(behavior);
        return createSnippet(statements);
    }

    @Override
    public String createSnippet(EObject actionCode) {
        return snippetCompiler.visit(actionCode);
    }

}
