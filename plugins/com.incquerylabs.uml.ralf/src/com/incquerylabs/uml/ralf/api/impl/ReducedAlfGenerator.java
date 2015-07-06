package com.incquerylabs.uml.ralf.api.impl;

import java.util.Map;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.uml2.uml.OpaqueBehavior;

import com.google.common.collect.Maps;
import com.google.inject.Inject;
import com.incquerylabs.uml.ralf.api.IReducedAlfParser;
import com.incquerylabs.uml.ralf.api.IReducedAlfGenerator;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements;
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfSnippetCompiler;

public class ReducedAlfGenerator implements IReducedAlfGenerator {
      
    private ReducedAlfSnippetCompiler snippetCompiler;
    
    private Map<String, String> snippetMap;
    
    @Inject
    public ReducedAlfGenerator() {
        snippetMap = Maps.newHashMap();
        snippetCompiler = new ReducedAlfSnippetCompiler();
    }

    @Override
    public Map<String, String> getSnippetMap() {
        return snippetMap;
    }

    @Override
    public String createSnippet(OpaqueBehavior behavior, IReducedAlfParser parser) {
        Statements statements = parser.parse(behavior);
        return createSnippet(statements);
    }
    
    @Override
    public String createSnippet(String behavior, IReducedAlfParser parser) {
        Statements statements = parser.parse(behavior);
        return createSnippet(statements);
    }

    @Override
    public String createSnippet(EObject actionCode) {
        return snippetCompiler.visit(actionCode);
    }

}
