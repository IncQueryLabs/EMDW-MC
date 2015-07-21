package com.incquerylabs.uml.ralf.api.impl;

import java.util.Map;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.uml2.uml.OpaqueBehavior;

import com.google.common.collect.Maps;
import com.google.inject.Inject;
import com.incquerylabs.uml.ralf.api.IReducedAlfGenerator;
import com.incquerylabs.uml.ralf.api.IReducedAlfParser;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements;
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfSnippetTemplateCompiler;

import snippetTemplate.Snippet;

public class ReducedAlfGenerator implements IReducedAlfGenerator {
      
    private ReducedAlfSnippetTemplateCompiler templateCompiler;
    
    private Map<Snippet, String> snippetMap;
    
    @Inject
    public ReducedAlfGenerator() {
        snippetMap = Maps.newHashMap();
        templateCompiler = new ReducedAlfSnippetTemplateCompiler();
    }

    @Override
    public Map<Snippet, String> getSnippetMap() {
        return snippetMap;
    }

    @Override
    public Snippet createSnippet(OpaqueBehavior behavior, IReducedAlfParser parser) {
        Statements statements = parser.parse(behavior);
        return createSnippet(statements);
    }
    
    @Override
    public Snippet createSnippet(String behavior, IReducedAlfParser parser) {
        Statements statements = parser.parse(behavior);
        return createSnippet(statements);
    }

    @Override
    public Snippet createSnippet(EObject actionCode) {
        return templateCompiler.visit(actionCode);
    }

}
